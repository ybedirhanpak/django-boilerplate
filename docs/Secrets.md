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
Environment variables in `.env` will override all others, including the docker-compose.yaml.

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
  postgres_host: <base64 value>
  postgres_name: <base64 value>
  postgres_user: <base64 value>
  postgres_password: <base64 value>
  email_host_user: <base64 value>
  email_host_password: <base64 value>
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
