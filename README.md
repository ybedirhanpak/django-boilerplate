[![Django CI](https://github.com/ybedirhanpak/django-boilerplate/workflows/Django%20CI/badge.svg?branch=master&event=push)](https://github.com/ybedirhanpak/django-boilerplate/actions?query=workflow%3A%22Django+CI%22)
[![Docker Image](https://github.com/ybedirhanpak/django-boilerplate/workflows/Docker%20Image/badge.svg?branch=master&event=push)](https://github.com/ybedirhanpak/django-boilerplate/actions?query=workflow%3A%22Docker+Image%22)
[![Version](https://img.shields.io/github/v/release/ybedirhanpak/django-boilerplate?include_prereleases)](https://github.com/ybedirhanpak/django-boilerplate/releases)

![Django Boilerplate](https://raw.githubusercontent.com/ybedirhanpak/django-boilerplate/master/logo/logo.png)

Django Boilerplate provides common needs of a django based REST API and CI/CD setup.

# Use this template

1. **Create your repository**

Select **Use this template** button on this repository and enter your repository name. You've created your repository.

2. **Clone your repository**

Clone your repository and open your project directory.

3. **Configure setup script**

In `setup.sh` file, you need to set some environment variables:

```
# Your app name must match your repository name
# This will assume that your repository is at github.com/$GITHUB_USERNAME/$APP_NAME

# Enter your github username
GITHUB_USERNAME=your-username
# Enter your application name that will be also repository name
APP_NAME=your-app-name
# Enter your application name as a label
APP_LABEL="Your App Label"
```

3. **Run setup script**

```bash
chown +x ./setup.sh
./setup.sh
```

4. **Commit Changes**

```bash
git add .
git commit -m "Initial setup"
```

## Run this project with docker-compose

Recommended way of running local server is using `docker-compose up`. It will install all python and system dependencies inside the container and run local server with live reload. You can configure it to use/not use PostgreSQL. PostgreSQL and SQLite are only options for now.

### Interact with container

With these command you can run executables in your container:

```
docker-compose exec <service-name> <executable>
```

- **Create superuser**

```
docker-compose exec django-boilerplate ./manage.py createsuperuser
```

- **Open python shell**

```
docker-compose exec django-boilerplate ./manage.py shell
```

## Run this project without docker-compose

### Prepare poetry

- Install poetry

```bash
# Clone repository
git clone https://github.com/ybedirhanpak/django-boilerplate.git

# Change directory into project
cd django-boilerplate

# Install poetry
python3 -m pip install poetry

# Activate poetry
poetry shell

# Install python packages
poetry install

# Migrate database
python manage.py migrate

# Run server
python manage.py runserver
```

## Further documentation

You can find more specific documentations in `/docs` folder.
