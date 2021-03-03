[![Django CI](https://github.com/ybedirhanpak/django-boilerplate/workflows/Django%20CI/badge.svg?branch=master&event=push)](https://github.com/ybedirhanpak/django-boilerplate/actions?query=workflow%3A%22Django+CI%22)
[![Docker Image](https://github.com/ybedirhanpak/django-boilerplate/workflows/Docker%20Image/badge.svg?branch=master&event=push)](https://github.com/ybedirhanpak/django-boilerplate/actions?query=workflow%3A%22Docker+Image%22)
[![Version](https://img.shields.io/github/v/release/ybedirhanpak/django-boilerplate?include_prereleases)](https://github.com/ybedirhanpak/django-boilerplate/releases)


![Django Boilerplate](https://raw.githubusercontent.com/ybedirhanpak/django-boilerplate/master/logo/logo.png)

Django Boilerplate provides common needs of a django based REST API and CI/CD setup.

# Run on your local

Recommended way of running local server is using `docker-compose up`. It will install all python and system dependencies inside the container and run local server with live reload. You can configure it to use/not use PostgreSQL. PostgreSQL and SQLite are only options for now.

## Interact with container
With these command you can run executables in your container:

```
docker-compose exec <service-name> <executable>
```

* **Create superuser**
```
docker-compose exec django-boilerplate ./manage.py createsuperuser
```

* **Open python shell**
```
docker-compose exec django-boilerplate ./manage.py shell
```

You can also run with `python3 manage.py runserver`, but you may need to install some of these packages:

```
gcc
libffi-dev
jpeg-dev
zlib-dev
libjpeg
postgresql-dev
```

# Use this template

### Create your repository
Select **Use this template** button on this repository and enter your repository name, done.

## Update GitHub Actions
* **[.github/workflows/docker-image.yml](.github/workflows/docker-image.yml)**

Change docker image name

**from**
```repository: ${{ github.repository }}/django```
**to**
```repository: ${{ github.repository }}/<your-image-name>```

* **[README.md](README.md)**

Change README badge urls so that they will provide status of your project's CI,CD and Version status

## Further documentation

You can find more specific documentations in `/docs` folder.
