FROM nginx:latest

# Copy the contents of the project to the NGINX web root
COPY . /usr/share/nginx/html

# Copy the custom nginx configuration
COPY default.conf /etc/nginx/templates/

# Expose the port your app runs on
ENV PORT 8080
EXPOSE 8080

CMD /bin/bash -c "envsubst '\$PORT' < /etc/nginx/templates/default.conf > /etc/nginx/conf.d/default.conf && exec nginx -g 'daemon off;'"