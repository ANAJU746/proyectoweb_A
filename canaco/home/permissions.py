def es_administrador(user):
    if not user.is_authenticated or not user.is_active:
        return False

    if user.is_superuser:
        return True

    grupos_administradores = {'admin', 'admins', 'administrador', 'administradores'}
    return any(
        nombre.casefold() in grupos_administradores
        for nombre in user.groups.values_list('name', flat=True)
    )
