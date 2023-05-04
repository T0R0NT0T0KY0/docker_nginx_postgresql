# Use an official Nginx image as the parent image
FROM nginx:latest

# Set the maintainer information
MAINTAINER Dmitry TF <Robbin-the-Bobbin@yandex.ru>

# Update the package manager and install PostgreSQL client
RUN apt-get update && apt-get install -y postgresql-client

# Create directory for client_temp
RUN mkdir /var/cache/nginx/client_temp && \
    chown -R nginx:nginx /var/cache/nginx

RUN mkdir -p /run/nginx && chown -R nginx:nginx /run/nginx
RUN chmod 777 /var/run
# Set the working directory to /app
WORKDIR /app

# Set the environment variable for PostgreSQL connection
ENV POSTGRES_USER postgres
ENV POSTGRES_PASSWORD password
ENV POSTGRES_HOST db
ENV POSTGRES_PORT 5432
ENV POSTGRES_DB mydatabase

# Add the Nginx configuration file
ADD nginx.conf /etc/nginx/nginx.conf

COPY ./html /usr/share/nginx/html/

# Copy the application files to the container
COPY . /app

# Create a volume for the PostgreSQL data
VOLUME /var/lib/postgresql/data

# Set the user to run the container
USER postgres

# Expose port 80 for Nginx
EXPOSE 80
# Expose port POSTGRES_PORT for POSTGRES
EXPOSE $POSTGRES_PORT

# Set the command to start Nginx
CMD ["nginx", "-g", "daemon off;"]
