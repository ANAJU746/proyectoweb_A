from django.test import TestCase
from django.contrib.auth.models import Group, User
from django.core.files.uploadedfile import SimpleUploadedFile
from django.urls import reverse
from .models import Archivo, GaleriaPublicacion, Publicacion


class AdminAccessTests(TestCase):
    def setUp(self):
        self.profile_url = reverse('home:perfil')
        self.users_url = reverse('home:crud_usuarios')

    def test_staff_user_without_admin_group_cannot_access_admin_route(self):
        editor = User.objects.create_user(
            username='editor',
            password='test-password',
            is_staff=True,
        )
        self.client.force_login(editor)

        response = self.client.get(self.users_url)

        self.assertRedirects(response, self.profile_url)

    def test_admin_group_member_can_access_admin_route_and_sees_admin_menu(self):
        admin = User.objects.create_user(username='group-admin', password='test-password')
        group = Group.objects.create(name='Administradores')
        admin.groups.add(group)
        self.client.force_login(admin)

        response = self.client.get(self.users_url)

        self.assertEqual(response.status_code, 200)
        self.assertContains(response, self.users_url)

    def test_regular_user_does_not_see_admin_menu(self):
        user = User.objects.create_user(username='member', password='test-password')
        self.client.force_login(user)

        response = self.client.get(self.profile_url)

        self.assertEqual(response.status_code, 200)
        self.assertNotContains(response, self.users_url)


class NewsGalleryTests(TestCase):
    def setUp(self):
        self.admin = User.objects.create_user(username='news-admin', password='test-password')
        admin_group = Group.objects.create(name='Administradores')
        self.admin.groups.add(admin_group)
        self.client.force_login(self.admin)

    def test_news_page_renders_its_gallery_images(self):
        author = User.objects.create_user(username='reporter', password='test-password')
        publication = Publicacion.objects.create(
            titulo='Noticia con galería',
            resumen='Resumen',
            contenido='Contenido',
            autor=author,
            estado=Publicacion.ESTADO_PUBLICADO,
        )
        image = Archivo.objects.create(
            nombre='galeria.jpg',
            nombre_temporal='galeria.jpg',
            ruta='uploads/galeria.jpg',
        )
        GaleriaPublicacion.objects.create(publicacion=publication, archivo=image)

        response = self.client.get(
            reverse('home:noticia_detalle', args=[publication.pk])
        )

        self.assertContains(response, 'Galería Fotográfica')
        self.assertContains(response, image.display_url)
        self.assertContains(response, 'newsGalleryCarousel')
        self.assertContains(response, 'image-lightbox-modal')

    def test_edit_page_displays_existing_gallery_and_new_image_preview(self):
        publication = Publicacion.objects.create(
            titulo='Noticia editable',
            resumen='Resumen',
            contenido='Contenido',
        )
        cover_image = Archivo.objects.create(
            nombre='portada.jpg',
            nombre_temporal='portada.jpg',
            ruta='uploads/portada.jpg',
        )
        publication.imagen_portada = cover_image
        publication.save()
        image = Archivo.objects.create(
            nombre='actual.jpg',
            nombre_temporal='actual.jpg',
            ruta='uploads/actual.jpg',
        )
        gallery_item = GaleriaPublicacion.objects.create(
            publicacion=publication,
            archivo=image,
        )

        response = self.client.get(
            reverse('home:editar_publicacion', args=[publication.pk])
        )

        self.assertContains(response, cover_image.display_url)
        self.assertContains(response, 'inputPortadaUnica')
        self.assertContains(response, 'previewPortadaBox')
        self.assertContains(response, 'checkEliminarPortada')
        self.assertContains(response, 'btnCancelarPortadaNueva')
        self.assertContains(response, image.display_url)
        self.assertContains(response, f'value="{gallery_item.pk}"')
        self.assertContains(response, 'inputGaleriaMultiple')
        self.assertContains(response, 'previewGaleriaBox')
        self.assertContains(response, 'containerMinaturasNuevas')
        self.assertContains(response, 'btnLimpiarTodoGaleria')
        self.assertContains(response, ':not(#inputGaleriaMultiple)')

    def test_edit_page_deletes_only_gallery_items_belonging_to_publication(self):
        publication = Publicacion.objects.create(
            titulo='Noticia editable',
            resumen='Resumen',
            contenido='Contenido',
        )
        other_publication = Publicacion.objects.create(
            titulo='Otra noticia',
            resumen='Resumen',
            contenido='Contenido',
        )
        image = Archivo.objects.create(
            nombre='compartida.jpg',
            nombre_temporal='compartida.jpg',
            ruta='uploads/compartida.jpg',
        )
        item_to_delete = GaleriaPublicacion.objects.create(
            publicacion=publication,
            archivo=image,
        )
        unrelated_item = GaleriaPublicacion.objects.create(
            publicacion=other_publication,
            archivo=image,
        )

        response = self.client.post(
            reverse('home:editar_publicacion', args=[publication.pk]),
            {
                'titulo': publication.titulo,
                'resumen': publication.resumen,
                'contenido': publication.contenido,
                'estado': publication.estado,
                'eliminar_galeria': [item_to_delete.pk, unrelated_item.pk],
            },
        )

        self.assertRedirects(response, reverse('home:crud_noticias'))
        self.assertFalse(GaleriaPublicacion.objects.filter(pk=item_to_delete.pk).exists())
        self.assertTrue(GaleriaPublicacion.objects.filter(pk=unrelated_item.pk).exists())
        self.assertTrue(Archivo.objects.filter(pk=image.pk).exists())

    def test_edit_page_removes_cover_when_requested(self):
        publication = Publicacion.objects.create(
            titulo='Noticia con portada',
            resumen='Resumen',
            contenido='Contenido',
        )
        cover = Archivo.objects.create(
            nombre='portada.jpg',
            nombre_temporal='portada.jpg',
            ruta='uploads/portada.jpg',
        )
        publication.imagen_portada = cover
        publication.save()

        response = self.client.post(
            reverse('home:editar_publicacion', args=[publication.pk]),
            {
                'titulo': publication.titulo,
                'resumen': publication.resumen,
                'contenido': publication.contenido,
                'estado': publication.estado,
                'eliminar_portada': '1',
            },
        )

        self.assertRedirects(response, reverse('home:crud_noticias'))
        publication.refresh_from_db()
        self.assertIsNone(publication.imagen_portada)
        self.assertTrue(Archivo.objects.filter(pk=cover.pk).exists())

    def test_new_cover_replaces_existing_cover_even_when_removal_is_checked(self):
        publication = Publicacion.objects.create(
            titulo='Noticia con portada',
            resumen='Resumen',
            contenido='Contenido',
        )
        old_cover = Archivo.objects.create(
            nombre='portada-anterior.jpg',
            nombre_temporal='portada-anterior.jpg',
            ruta='uploads/portada-anterior.jpg',
        )
        publication.imagen_portada = old_cover
        publication.save()

        response = self.client.post(
            reverse('home:editar_publicacion', args=[publication.pk]),
            {
                'titulo': publication.titulo,
                'resumen': publication.resumen,
                'contenido': publication.contenido,
                'estado': publication.estado,
                'eliminar_portada': '1',
                'imagen_portada': SimpleUploadedFile(
                    'nueva.jpg',
                    b'new image data',
                    content_type='image/jpeg',
                ),
            },
        )

        self.assertRedirects(response, reverse('home:crud_noticias'))
        publication.refresh_from_db()
        self.assertNotEqual(publication.imagen_portada_id, old_cover.pk)
        self.assertEqual(publication.imagen_portada.nombre, 'nueva.jpg')
