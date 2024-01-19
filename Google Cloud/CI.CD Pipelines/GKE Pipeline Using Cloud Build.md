# GKE Pipeline Using Cloud Build

In this lab, you create a CI/CD pipeline that automatically builds a container image from committed code, stores the image in Artifact Registry, updates a Kubernetes manifest in a Git repository, and deploys the application to Google Kubernetes Engine using that manifest.

For this lab you will create 2 Git repositories:

app repository: contains the source code of the application itself

env repository: contains the manifests for the Kubernetes Deployment

When you push a change to the app repository, the Cloud Build pipeline runs tests, builds a container image, and pushes it to Artifact Registry. After pushing the image, Cloud Build updates the Deployment manifest and pushes it to the env repository. This triggers another Cloud Build pipeline that applies the manifest to the GKE cluster and, if successful, stores the manifest in another branch of the env repository.

The app and env repositories are kept separate because they have different lifecycles and uses. The main users of the app repository are actual humans and this repository is dedicated to a specific application. The main users of the env repository are automated systems (such as Cloud Build), and this repository might be shared by several applications. The env repository can have several branches that each map to a specific environment (you only use production in this lab) and reference a specific container image, whereas the app repository does not.

## Getting Started

**1. Activate Cloud Shell**

Click Activate Cloud Shell Activate Cloud Shell icon at the top of the Google Cloud console.
