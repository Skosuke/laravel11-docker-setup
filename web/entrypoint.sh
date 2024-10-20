#!/bin/sh
chown -R nginx:nginx /usr/share/nginx/html && \
chmod -R 775 /usr/share/nginx/html/storage /usr/share/nginx/html/bootstrap/cache

# Execute the main process
exec "$@"
