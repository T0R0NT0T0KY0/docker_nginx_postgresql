# Docker (Nginx + PostgreSQL)
### Comments inside the Dockerfile explain what each step does:

- Step 1: Use the official PostgreSQL image and set the environment variable with the password.
- Step 2: Use the official Nginx image and copy the configuration file for Nginx.
- Step 3: Use the official Node.js image, install dependencies, and copy the application. Application build starts.
- Step 4: Use the Nginx image, merge the images from the previous steps, and start Nginx on port 80.
### The assembled image can be called "name_initials_image_<current date>" using the command:

```perl
docker build -t name_initials_image_$(date +%Y-%m-%d) .
```
![docker_build.png](img%2Fdocker_build.png)

### After running this command, the image will be created and you can start the container using the command:

```perl
docker run -p 80:80 -p 5432:5432 --user nginx name_initials_image_$(date +%Y-%m-%d)
```
![docker_run.png](img%2Fdocker_run.png)

### http://localhost:8080/
![localhost8080.png](img%2Flocalhost8080.png)


### http://localhost:8080/404.html
![localhost8080404.png](img%2Flocalhost8080404.png)

### http://localhost:8080/50x.html
![localhost808050x.png](img%2Flocalhost808050x.png)
