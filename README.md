[![Django CI](https://github.com/ybedirhanpak/django-boilerplate/workflows/Django%20CI/badge.svg?branch=master&event=push)](https://github.com/ybedirhanpak/django-boilerplate/actions?query=workflow%3A%22Django+CI%22)
[![Docker Image](https://github.com/ybedirhanpak/django-boilerplate/workflows/Docker%20Image/badge.svg?branch=master&event=push)](https://github.com/ybedirhanpak/django-boilerplate/actions?query=workflow%3A%22Docker+Image%22)
[![Version](https://img.shields.io/github/v/release/ybedirhanpak/django-boilerplate?include_prereleases)](https://github.com/ybedirhanpak/django-boilerplate/releases)


![Django Boilerplate](https://raw.githubusercontent.com/ybedirhanpak/django-boilerplate/master/logo/logo.png)

Django Boilerplate provides common needs of a django based REST API and CI/CD setup.

## Use this template

### Create your repository
Create **Use this template** button on this repository and enter your repository name, done.

### Update GitHub Actions
* **[.github/workflows/docker-image.yml](.github/workflows/docker-image.yml)**

Change docker image name

**from**
```repository: ${{ github.repository }}/django```
**to**
```repository: ${{ github.repository }}/<your-image-name>```

* **[README.md](README.md)**

Change README badge urls so that they will provide status of your project's CI,CD and Version status

### GitHub Secrets

These secrets are required for proper GKE CD setup as you can see at **[.github/workflows/google.yml](.github/workflows/google.yml)**

| Secret Name     | Explanation                                                                                                                                                                                                                   |
|-----------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| GKE_PROJECT     | Your google cloud project ID. Example: my-project-12345                                                                                                                                                                       |
| GKE_EMAIL       | Service account mail in your google cloud project. Make sure that that service account has permission to manage Kubernetes Engine and Cloud Storage. Example: your-service-account@your-project-12345.iam.gserviceaccount.com |
| GKE_KEY         | Base64 representation of your service account's JSON key.                                                                                                                                                                     |
| GKE_CLUSTER     | Kubernetes cluster name. Example: my-project-cluster                                                                                                                                                                          |
| GKE_ZONE        | Kubernetes cluster zone. Example: us-west1-a                                                                                                                                                                                  |
| IMAGE           | Docker image name. Example: my-django-image                                                                                                                                                                                   |
| DEPLOYMENT_NAME | Kubernetes deployment name. Example: my-django-deployment                                                                                                                                                                     |
