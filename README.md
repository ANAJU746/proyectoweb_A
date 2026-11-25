<div align="center">

# 📰 CANACO Prensa — Portal Informativo & Centro de Control Editorial

**Edición Digital moderna desarrollada con Django, MySQL, AJAX y desplegada en Microsoft Azure con Nginx y SSL.**

[![Python](https://img.shields.io/badge/Python-3.10+-3776AB?style=for-the-badge&logo=python&logoColor=white)](https://www.python.org/)
[![Django](https://img.shields.io/badge/Django-Framework-092E20?style=for-the-badge&logo=django&logoColor=white)](https://www.djangoproject.com/)
[![MySQL](https://img.shields.io/badge/MySQL-Database-4479A1?style=for-the-badge&logo=mysql&logoColor=white)](https://www.mysql.com/)
[![Bootstrap 5](https://img.shields.io/badge/Bootstrap-5.3-7952B3?style=for-the-badge&logo=bootstrap&logoColor=white)](https://getbootstrap.com/)
[![Nginx](https://img.shields.io/badge/Nginx-SSL%20Proxy-009639?style=for-the-badge&logo=nginx&logoColor=white)](https://nginx.org/)
[![Azure](https://img.shields.io/badge/Microsoft%20Azure-Ubuntu%20VM-0078D4?style=for-the-badge&logo=microsoftazure&logoColor=white)](https://azure.microsoft.com/)

🌐 **Sitio en producción:** [https://canacoam.me](https://canacoam.me)

</div>

---

## 📖 Acerca del Proyecto

**CANACO Prensa** es una plataforma web de gestión y publicación de noticias diseñada con una estética editorial moderna y un panel administrativo ágil. El proyecto integra buenas prácticas de desarrollo web full-stack: desde una experiencia de usuario fluida sin recargas de página mediante **AJAX**, hasta un despliegue seguro en la nube con certificados **SSL**, **Nginx** y administración de servicios en Linux (`systemd`).

---

## ✨ Características Principales

### 🌐 Portal Público
- **Portada Editorial Dinámica:** Visualización de noticias recientes, categorización por secciones y lectura detallada de artículos.
- **Modal Automático de Última Noticia:** Ventana emergente al ingresar al portal que destaca la publicación más reciente; gestionada con `sessionStorage` para mostrarse solo una vez por sesión sin resultar invasiva.
- **Sistema de Comentarios:** Soporte para comentarios de usuarios registrados y comentarios anónimos con íconos vectoriales de Bootstrap.
- **Privacidad y Analítica:** Banner interactivo de consentimiento de cookies (`localStorage`) que activa **Google Analytics (GA4)** únicamente tras la aceptación del usuario.

### 🛠️ Centro de Control Editorial (Panel Administrativo)
- **Operaciones CRUD con AJAX (Fetch API):** Gestión fluida y en tiempo real **sin recargar la página** para:
  - **Secciones / Categorías:** Creación, edición en línea (alternando dinámicamente el botón *Agregar / Actualizar*) y eliminación instantánea.
  - **Moderación de Comentarios:** Aprobación, bloqueo y eliminación asíncrona.
  - **Mi Expediente (Perfil):** Actualización de datos personales y envío de imágenes mediante `FormData`.
- **Editor y Recortador de Foto de Perfil (`Cropper.js`):** Modal interactivo que permite encuadrar y recortar imágenes en relación `1:1`, optimizándolas automáticamente a formato `.jpg` ligero (`400x400 px`) en el navegador antes de subirlas al servidor.
- **Control de Acceso y Seguridad:** Autenticación de usuarios, protección CSRF configurada para producción (`CSRF_TRUSTED_ORIGINS`) y gestión de roles.

---

## 🧰 Stack Tecnológico

| Capa | Tecnologías Utilizadas |
| :--- | :--- |
| **Backend** | Python, Django, Django ORM |
| **Base de Datos** | MySQL |
| **Frontend** | HTML5, CSS3, Bootstrap 5, Bootstrap Icons, JavaScript (ES6+ / Fetch API) |
| **Librerías UI** | Cropper.js (recorte de avatares), CKEditor / Quill |
| **Infraestructura** | Microsoft Azure (Ubuntu Server), Nginx (Proxy Inverso + HTTPS/SSL), Systemd |
| **Analítica** | Google Analytics (GA4) con carga condicional por cookies |

---

## 🏗️ Arquitectura de Despliegue

El servidor en **Microsoft Azure** opera bajo un esquema robusto y automatizado:

```text
[ Cliente / Navegador (HTTPS) ]
              │
              ▼
   [ Nginx (Puertos 80 / 443) ]  ──► Certificados SSL & Archivos Estáticos/Media
              │
              ▼ (Proxy inverso 127.0.0.1:8000)
   [ Servicio systemd: canaco ]  ──► Aplicación Django (dependiente de mysql.service)
              │
              ▼
       [ MySQL Server ]          ──► Base de datos relacional local
```

> **Alta disponibilidad en reinicios:** El servicio `canaco.service` está configurado con `Requires=mysql.service`, `After=network.target mysql.service` y `Restart=always`, garantizando que la base de datos inicie antes que Django y evitando errores `502 Bad Gateway` tras reiniciar la máquina virtual.

---

## 🚀 Instalación Local

Sigue estos pasos para ejecutar el proyecto en tu entorno de desarrollo:

1. **Clonar el repositorio**
   ```bash
   git clone https://github.com/tu-usuario/canaco-prensa.git
   cd canaco-prensa
   ```

2. **Crear y activar el entorno virtual**
   ```bash
   python -m venv entorno_django
   # En Windows:
   entorno_django\Scripts\activate
   # En Linux / macOS:
   source entorno_django/bin/activate
   ```

3. **Instalar dependencias**
   ```bash
   pip install -r requirements.txt
   ```

4. **Configurar la base de datos MySQL**
   Ajusta tus credenciales en `settings.py` y ejecuta las migraciones:
   ```bash
   python manage.py makemigrations
   python manage.py migrate
   ```

5. **Crear un superusuario y levantar el servidor**
   ```bash
   python manage.py createsuperuser
   python manage.py runserver
   ```
   Accede al proyecto en `http://127.0.0.1:8000/`.

---

## 📂 Estructura General del Proyecto

```text
canaco/
├── canaco/                # Configuración principal de Django (settings, urls, wsgi)
├── home/                  # Aplicación principal (modelos, vistas AJAX, formularios)
│   ├── templates/
│   │   ├── home/          # index.html, crud_categorias.html, crud_perfil.html, etc.
│   │   └── partials/      # base.html, sidebar_base.html
│   └── views.py           # Lógica del portal y endpoints JsonResponse
├── static/                # Hojas de estilo, scripts e imágenes estáticas
├── media/                 # Archivos subidos (portadas de noticias y fotos de perfil)
└── manage.py
```

---

## 📄 Licencia

Este proyecto fue desarrollado con fines académicos y demostrativos. Puedes consultar o adaptar el código citando al autor correspondiente.

<div align="center">
  Hecho con ❤️ usando Django, Bootstrap y Azure.
</div>
