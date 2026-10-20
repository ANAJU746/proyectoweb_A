from django.test import TestCase
from django.contrib.auth.models import Group, User
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
