FROM nginx:alpine

# Copy the static website files to nginx's default directory
COPY . /usr/share/nginx/html/

# Copy a custom nginx configuration if needed
# COPY nginx.conf /etc/nginx/nginx.conf

# Expose port 80
EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"]