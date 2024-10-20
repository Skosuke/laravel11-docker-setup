# ./nginx/Dockerfile
FROM amazonlinux:2023

# Install Nginx and OpenSSL
RUN dnf update -y && \
    dnf install -y nginx \
    vim \
    openssl

RUN mkdir -p /etc/pki/nginx/private

# Create a directory for SSL certificates
RUN mkdir /etc/nginx/ssl

# Generate a self-signed certificate and private key
RUN openssl genrsa -out /etc/pki/nginx/private/server.key 2048 && \
    openssl req -new -key /etc/pki/nginx/private/server.key -out /etc/pki/nginx/server.csr -subj "/CN=localhost" && \
    openssl x509 -req -days 365 -in /etc/pki/nginx/server.csr -signkey /etc/pki/nginx/private/server.key -out /etc/pki/nginx/server.crt

# Copy the custom Nginx configuration file
COPY nginx/nginx.conf /etc/nginx/nginx.conf

# Expose port 80 and 443 for HTTPS
EXPOSE 80 443

# Start Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
