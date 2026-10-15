# Canaco

<p align="center">
  <img src="https://images.unsplash.com/photo-1504711331083-9c895941bf81?auto=format&fit=crop&w=1400&q=80" alt="Portada de noticias" width="100%" />
</p>

<p align="center">
  <img alt="Python" src="https://img.shields.io/badge/Python-3.10%2B-3776AB?logo=python&logoColor=white" />
  <img alt="Django" src="https://img.shields.io/badge/Django-4.2-092E20?logo=django&logoColor=white" />
  <img alt="MySQL" src="https://img.shields.io/badge/MySQL-8.0-4479A1?logo=mysql&logoColor=white" />
  <img alt="Bootstrap" src="https://img.shields.io/badge/Bootstrap-5-7952B3?logo=bootstrap&logoColor=white" />
  <img alt="License" src="https://img.shields.io/badge/License-Project%20Internal-lightgrey" />
</p>

Portal de noticias y gestión editorial desarrollado con Django para publicar contenido, administrar usuarios, categorizar noticias y moderar comentarios en una experiencia moderna y sencilla.

## Descripción general

Canaco es un sistema web de noticias orientado a medios digitales que permite:

- publicar artículos con portada y galería multimedia
- organizar el contenido por categorías
- consultar noticias destacadas y recientes
- registrar e iniciar sesión de usuarios
- gestionar perfiles personales y cambio de contraseña
- moderar comentarios de la comunidad
- administrar contenido desde un panel de operaciones

## ✨ Características principales

### Publicaciones

- creación de noticias con título, resumen, contenido y estado
- soporte para imagen de portada
- galería de imágenes por publicación
- conteo de visitas por artículo
- control de publicaciones en borrador o publicadas

### Categorías y navegación

- administración de categorías
- clasificación por tipo de contenido
- listado global para navegación del sitio

### Comentarios

- comentarios pendientes, aprobados y bloqueados
- flujo de moderación para contenido del usuario
- visualización de comentarios en la noticia

### Usuarios y perfiles

- registro de usuarios
- autenticación con Django
- perfil del usuario con foto y datos adicionales
- actualización de información personal
- cambio de contraseña seguro

### Administración

- gestión de noticias, categorías y usuarios
- revisión de comentarios
- acceso restringido a operadores y personal administrativo

## 🛠️ Stack tecnológico

- Python
- Django 4.2
- MySQL
- HTML5
- CSS3
- JavaScript
- Bootstrap s
- Django ORM

## 📁 Estructura del proyecto

```text
canaco/
├── canaco/                          # Proyecto principal de Django
│   ├── __init__.py
│   ├── asgi.py
│   ├── settings.py                 # Configuración general del proyecto
│   ├── urls.py                     # Rutas principales
│   ├── wsgi.py
│   └── __pycache__/
├── home/                           # Aplicación principal del sitio
│   ├── admin.py
│   ├── apps.py
│   ├── context_processors.py
│   ├── migrations/
│   ├── models.py                  # Modelos de datos
│   ├── signals.py
│   ├── templates/                 # Vistas HTML
│   ├── tests.py
│   ├── urls.py                    # Rutas de la app
│   └── views.py                   # Lógica de negocio y controladores
├── static/                         # Archivos CSS, JS, imágenes globales
├── media/                          # Archivos subidos por usuarios y publicaciones
├── db.sqlite3                      # Base de datos local
├── manage.py                       # Comando principal de Django
├── README.md
├── .gitignore
└── requirements.txt               # Dependencias del proyecto
```

## 🚀 Requisitos previos

Antes de iniciar el proyecto, asegúrate de tener instalado:

- Python 3.10 o superior
- pip
- MySQL o cualquier base de datos compatible
- entorno virtual recomendado

## ⚙️ Instalación

### 1. Clonar el repositorio

```bash
git clone <url-del-repositorio>
cd canaco
```

### 2. Crear entorno virtual

```bash
python -m venv venv
```

Windows:

```bash
venv\Scripts\activate
```

Linux/macOS:

```bash
source venv/bin/activate
```

### 3. Instalar dependencias

```bash
pip install django mysqlclient
```

Si agregas un archivo `requirements.txt` en el futuro, puedes usar:

```bash
pip install -r requirements.txt
```

### 4. Configurar la base de datos

El proyecto está preparado para trabajar con MySQL en `canaco/settings.py`. Ajusta las credenciales según tu entorno:

```python
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'canaco',
        'USER': 'root',
        'PASSWORD': '',
        'HOST': 'localhost',
        'PORT': '3307',
    }
}
```

Crea la base de datos en MySQL:

```sql
CREATE DATABASE canaco;
```

### 5. Ejecutar migraciones

```bash
python manage.py migrate
```

### 6. Crear superusuario

```bash
python manage.py createsuperuser
```

### 7. Iniciar el servidor

```bash
python manage.py runserver
```

Accede a la app en:

```text
http://127.0.0.1:8000/
```

## 🧭 Rutas principales

- `/` — inicio del sitio
- `/login/` — inicio de sesión
- `/sign_up/` — registro de usuarios
- `/perfil/` — perfil del usuario
- `/categoria/` — listado de categorías
- `/noticia/` — noticias disponibles
- `/admin/` — panel administrativo de Django
- `/crud_noticias/` — administración de publicaciones
- `/crud_categorias/` — administración de categorías
- `/crud_usuarios/` — gestión de usuarios
- `/crud_comentarios/` — moderación de comentarios

## 🧩 Modelos principales

- `Categoria`: clasifica las noticias
- `Publicacion`: almacena el contenido editorial
- `Comentario`: gestiona feedback y discusión
- `Perfil`: guarda datos extendidos del usuario
- `Archivo`: administra archivos e imágenes subidas
- `GaleriaPublicacion`: colección de imágenes asociadas a una noticia

## 🖼️ Vista del proyecto

<p align="center">
  <img src="https://images.unsplash.com/photo-1495020689067-958852a7765e?auto=format&fit=crop&w=1200&q=80" alt="Diseño de noticia" width="48%" />
  <img src="https://images.unsplash.com/photo-1516321165247-4aa89a48be28?auto=format&fit=crop&w=1200&q=80" alt="Panel editorial" width="48%" />
</p>

> Estas imágenes sirven como referencia visual del estilo general del portal de noticias.

## 📌 Buenas prácticas recomendadas

- cambiar `DEBUG = True` en producción
- proteger `SECRET_KEY`
- usar variables de entorno para credenciales
- configurar un servidor web y base de datos adecuados para despliegue real
- añadir validaciones y pruebas automatizadas en futuras iteraciones

## 🔄 Flujo recomendado de uso

1. Crear una cuenta o iniciar sesión.
2. Acceder al panel de administrador o operador.
3. Crear categorías.
4. Publicar noticias con imagen de portada y galería.
5. Revisar y aprobar comentarios.
6. Mantener el contenido actualizado para mejorar la experiencia del lector.

## 📄 Licencia

Este proyecto está destinado a uso interno o académico según la necesidad del equipo. Si deseas usarlo en producción o compartirlo públicamente, es recomendable definir una licencia apropiada.

## 👤 Créditos

Proyecto desarrollado como portal informativo con administración editorial y gestión de contenido en Django.

