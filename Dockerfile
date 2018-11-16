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
COPY init.sh .
RUN pip install -e .

RUN bin/mapit_make_css

EXPOSE 8000
CMD ["./init.sh"]


