from .models import Categoria, Publicacion
from .permissions import es_administrador


def global_categorias(request):
    return {
        'global_categorias': Categoria.objects.all().order_by('nombre'),
        'global_recientes': Publicacion.objects.filter(
            estado=Publicacion.ESTADO_PUBLICADO,
        ).select_related('imagen_portada').order_by('-createdat')[:3],
        'es_administrador': es_administrador(request.user),
    }
