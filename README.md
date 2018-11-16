mySociety's MapIt in Docker
===========================
This Docker container is made for only MapIt. The database is not created or imported here.

Configuration file should be made available as a Docker volume, see the example
docker-compose.yml.

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

To stop the service:

```
docker container stop <container-id>
```

## TODO ##

  * Deploy the Django app to a real web server instead of using the debug server.
