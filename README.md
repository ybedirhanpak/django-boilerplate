[![Django CI](https://github.com/ybedirhanpak/django-boilerplate/workflows/Django%20CI/badge.svg?branch=master&event=push)](https://github.com/ybedirhanpak/django-boilerplate/actions?query=workflow%3A%22Django+CI%22)
[![Docker Image](https://github.com/ybedirhanpak/django-boilerplate/workflows/Docker%20Image/badge.svg?branch=master&event=push)](https://github.com/ybedirhanpak/django-boilerplate/actions?query=workflow%3A%22Docker+Image%22)
[![Version](https://img.shields.io/github/v/release/ybedirhanpak/django-boilerplate?include_prereleases)](https://github.com/ybedirhanpak/django-boilerplate/releases)


![Django Boilerplate](https://raw.githubusercontent.com/ybedirhanpak/django-boilerplate/master/logo/logo.png)

Django Boilerplate provides common needs of a django based REST API and CI/CD setup.

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

# How to manage secrets

## GitHub Secrets

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


## Development Secrets

You can create `.env` file and store your environment variables there. This file won't be pushed to your repository.

## Kubernetes Secrets

Kubernetes secret yaml file and all other secret files can be stored in `key/` directory, which won't be pushed to your repository.

### How to apply secret yaml file

* **Create yaml file**

```
mkdir key/
touch key/secret.yaml
```

* **Configure your secrets**

```
key/secret.yaml

apiVersion: v1
kind: Secret
metadata:
  name: <secret-name>
type: Opaque
data:
  <key-1>: <base64-value>
```

You need to store your values in base64 format. You can conver string to base64 with:

```
echo -n 'string' | base64
```

* **Apply secret yaml**

Follow steps in [Google Cloud useful commands](https://github.com/ybedirhanpak/django-boilerplate#google-cloud-useful-commands) to have access to your cluster. Then apply your secret file.

```
kubectl apply -f key/secret.yaml
```

# Google Cloud useful commands
* **Run Google Cloud SDK using docker image**

```
docker run -it --rm -v ${PWD}:/workspace -w /workspace --entrypoint /bin/bash google/cloud-sdk:160.0.0
```

* **Login into Google Cloud**

Run this command, open upcoming url link to login your google account, then copy the verification code.
```
gcloud auth login
```

* **Preview list of projects**

```
gcloud projects list
```

* **Create new Google Cloud project**
```
gcloud projects create <project-name>
```

* **Select a project**
```
gcloud config set project <project-name>
```

* **Create Kubernetes Cluster**
```
gcloud container clusters create <cluster-name> \
--cluster-version <cluster-version> \
--num-nodes <number-of-nodes> \
--machine-type <machine-type-name> \
--zone <zone-name>
```

Example:

```
gcloud container clusters create django-boilerplate-cluster \
--cluster-version 1.15.12-gke.2 \
--num-nodes 2 \
--machine-type e2-medium \
--zone europe-west1-a 
```

* **Get a kubeconfig for the cluster**

```
gcloud container clusters get-credentials <cluster-name> --zone <zone-name>
```

* **Download Kubectl**
```
curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
chmod +x ./kubectl
mv ./kubectl /usr/local/bin/kubectl

```

* **Create Namespace**
```
kubectl create ns <namespace-name>
```

* **Apply YAML file**
```
kubectl apply -n <namespace-name> -f <path-to-yaml-file>
# or use default namespace
kubectl apply -f <path-to-yaml-file>
```

* **Delete Kubernetes Cluster**
```
gcloud container clusters delete <cluster-name> --zone <zone-name>
```