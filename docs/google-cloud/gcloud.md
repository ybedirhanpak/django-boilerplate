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
