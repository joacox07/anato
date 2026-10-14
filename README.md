# Vacaciones del Grupo

Calendario compartido de diciembre 2026 a abril 2027. Cada persona entra con su nombre, marca los días en que no puede y todos vemos cuándo estamos libres. Tiene un botón para exportar el calendario como imagen.

## Puesta en marcha (una sola vez, unos 5 minutos)

1. **Supabase**: creá un proyecto gratis en https://supabase.com.
2. En el proyecto: **SQL Editor → New query**, pegá el contenido de `supabase.sql` y tocá **Run**.
3. En **Project Settings → API** copiá la **Project URL** y la clave **anon public** y pegalas en `config.js`.
4. **GitHub Pages**: en el repo, **Settings → Pages → Build and deployment**, elegí *Deploy from a branch*, la rama donde está esta página y la carpeta `/ (root)`, y guardá.
5. En un minuto la web queda en `https://<tu-usuario>.github.io/anato/`. Pasale ese link al grupo.

Mientras `config.js` esté vacío, la página funciona en modo prueba y guarda los datos solo en tu navegador.

## Archivos

- `index.html`: la página completa.
- `config.js`: la URL y la clave pública de Supabase.
- `supabase.sql`: crea las tablas `people` y `ranges`, con acceso abierto para quien tenga el link y cambios en vivo.
