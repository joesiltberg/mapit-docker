MySociety's MapIt in Docker
===========================
This Docker container is made for only MapIt. The database is not created or imported here.

Configuration file is currently simply copied in at the build step of the Docker image,
so there needs to be a mapit/conf/general.yml when building the image.

Since the database is outside of the container, Postgres needs to be configured to listen to
the Docker network, and allow authentication on that network as well.

## Usage ##

Building the image:

```
docker build -t mapit .
```

Initialize/migrate the database:

```
docker run mapit python manage.py migrate mapit
```

You can create an admin account with:

```
docker run mapit python manage.py createsuperuser
```

To run the MapIt service (mapping the host's port 80 to the container's port 8000):

```
docker run -d -p 80:8000 mapit
```

Top stop the service:

```
docker container stop <container-id>
```

## TODO ##

  * Use Docker configs (and secrets?).
  * Deploy the Django app to a real web server instead of using the debug server.
