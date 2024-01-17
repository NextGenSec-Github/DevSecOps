# Create a cluster with 3 nodes

gcloud container clusters create myclustername \
  --machine-type e2-small \
  --num-nodes 3 \
  --scopes "https://www.googleapis.com/auth/projecthosting,storage-rw"
