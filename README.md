[![Django CI](https://github.com/ybedirhanpak/django-boilerplate/workflows/Django%20CI/badge.svg?branch=master&event=push)](https://github.com/ybedirhanpak/django-boilerplate/actions?query=workflow%3A%22Django+CI%22)
[![Docker Image](https://github.com/ybedirhanpak/django-boilerplate/workflows/Docker%20Image/badge.svg?branch=master&event=push)](https://github.com/ybedirhanpak/django-boilerplate/actions?query=workflow%3A%22Docker+Image%22)
[![Version](https://img.shields.io/github/v/release/ybedirhanpak/django-boilerplate?include_prereleases)](https://github.com/ybedirhanpak/django-boilerplate/releases)


# Django Boilerplate
This is a django boilerplate project, which will provide basic REST API, CI/CD setup.

## Use this template
* Change docker image name in [.github/workflows/docker-image.yml](.github/workflows/docker-image.yml)

```repository: ${{ github.repository }}/django``` --> ```repository: ${{ github.repository }}/<image-name>```

* Update [README.md](README.md)

Replace ```ybedirhanpak/django-boilerplate``` with your repository name at workflow badge urls.

## Create boilerplate from scratch
Read [Starter.md](Starter.md)
