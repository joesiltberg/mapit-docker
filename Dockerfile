FROM python:3.7.0-stretch

RUN apt-get update \
    && apt-get install -y \
        postgresql-client \
	python-gdal \
	binutils \
	libproj-dev \
	gdal-bin \
	memcached \
	python-memcache \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src/app
COPY requirements.txt ./
RUN pip install -r requirements.txt
COPY mapit .
RUN pip install -e .

RUN bin/mapit_make_css

EXPOSE 8000
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

