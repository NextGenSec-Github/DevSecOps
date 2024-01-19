# GKE Pipeline Using Cloud Build

In this hands-on project, you create a CI/CD pipeline that automatically builds a container image from committed code, stores the image in Artifact Registry, updates a Kubernetes manifest in a Git repository, and deploys the application to Google Kubernetes Engine using that manifest.

You will create 2 Git repositories:

1. app repository: contains the source code of the application itself

2. env repository: contains the manifests for the Kubernetes Deployment

When you push a change to the app repository, the Cloud Build pipeline runs tests, builds a container image, and pushes it to Artifact Registry. After pushing the image, Cloud Build updates the Deployment manifest and pushes it to the env repository. This triggers another Cloud Build pipeline that applies the manifest to the GKE cluster and, if successful, stores the manifest in another branch of the env repository.

The app and env repositories are kept separate because they have different lifecycles and uses. The main users of the app repository are actual humans and this repository is dedicated to a specific application. The main users of the env repository are automated systems (such as Cloud Build), and this repository might be shared by several applications. The env repository can have several branches that each map to a specific environment (you only use production in this lab) and reference a specific container image, whereas the app repository does not.

## Getting Started

**Activate Cloud Shell**

Click Activate Cloud Shell Activate Cloud Shell icon at the top of the Google Cloud console.

## Initialize 

In Cloud Shell, set your project ID and project number. Save them as PROJECT_ID and PROJECT_NUMBER variables:

```bash
export PROJECT_ID=$(gcloud config get-value project)
export PROJECT_NUMBER=$(gcloud projects describe $PROJECT_ID --format='value(projectNumber)')
export REGION=
gcloud config set compute/region $REGION
```
Run the following command to enable the APIs for GKE, Cloud Build, Cloud Source Repositories and Container Analysis:
```bash
gcloud services enable container.googleapis.com \
    cloudbuild.googleapis.com \
    sourcerepo.googleapis.com \
    containeranalysis.googleapis.com
```

Create an Artifact Registry Docker repository named `my-repository` in the region to store your container images:
```bash
gcloud artifacts repositories create my-repository \
  --repository-format=docker \
  --location=$REGION
```

Create a GKE cluster to deploy the sample application of this lab:

```bash
  gcloud container clusters create hello-cloudbuild --num-nodes 1 --region $REGION
```

If you have never used Git in Cloud Shell, configure it with your name and email address. Git will use those to identify you as the author of the commits you will create in Cloud Shell:

```bash
git config --global user.email "you@example.com"
git config --global user.name "Your Name"
```

## Create the Git repositories in Cloud Source Repositories

Now we will create the two Git repositories (hello-cloudbuild-app and hello-cloudbuild-env) and initialize hello-cloudbuild-app with some sample code.

In Cloud Shell, run the following to create the two Git repositories:
```bash
#app repository
gcloud source repos create hello-cloudbuild-app
```
```bash
#env repository
gcloud source repos create hello-cloudbuild-env
```

Clone the sample code from GitHub: 

```bash
cd ~
```
```bash
# NOTE: This code is from Google's repository
git clone https://github.com/GoogleCloudPlatform/gke-gitops-tutorial-cloudbuild hello-cloudbuild-app
```

Configure Cloud Source Repositories as a remote:
```bash
cd ~/hello-cloudbuild-app
```

```bash
PROJECT_ID=$(gcloud config get-value project)
```

```bash
git remote add google "https://source.developers.google.com/p/${PROJECT_ID}/r/hello-cloudbuild-app"
```

The code you just cloned contains a simple flask "Hello World" application.

![](https://github.com/yusufmunircloud/AWS-Projects/blob/main/img/general/Screenshot%202024-01-19%20224201.png?raw=true)

## Create a container image with Cloud Build

The code you cloned already contains the following Dockerfile.

![](https://github.com/yusufmunircloud/AWS-Projects/blob/main/img/general/Screenshot%202024-01-19%20224559.png?raw=true)



