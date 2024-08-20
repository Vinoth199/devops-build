# Step 1: Use Nginx to serve the already-built React app
FROM nginx:alpine

# Remove default Nginx static assets
RUN rm -rf /usr/share/nginx/html/*

# Copy your pre-built React app from the current folder to Nginx
COPY build/ /usr/share/nginx/html

# Expose the port Nginx will serve on
EXPOSE 80

