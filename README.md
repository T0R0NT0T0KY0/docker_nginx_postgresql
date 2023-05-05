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
![Снимок экрана 2023-05-05 в 10.37.19 AM.png](..%2F..%2F..%2F..%2F..%2F..%2Fvar%2Ffolders%2Fpd%2Fqds2_6214d1g60fgfr0g8pqm0000gn%2FT%2FTemporaryItems%2FNSIRD_screencaptureui_1o8bPi%2F%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA%20%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0%202023-05-05%20%D0%B2%2010.37.19%20AM.png)

### http://localhost:8080/
![localhost8080.png](img%2Flocalhost8080.png)


### http://localhost:8080/404.html
![localhost8080404.png](img%2Flocalhost8080404.png)

### http://localhost:8080/50x.html
![localhost808050x.png](img%2Flocalhost808050x.png)
