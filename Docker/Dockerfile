# Nginx as the base image, we can openjdk and others
FROM nginx:alpine

# Copying the index file 
COPY index.html /usr/share/nginx/html/

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
