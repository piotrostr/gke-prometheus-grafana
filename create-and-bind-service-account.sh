#!/bin/bash

PROJECT_ID=k8s-dumpster
NAMESPACE_NAME=prometheus

gcloud config set project $PROJECT_ID && \
gcloud iam service-accounts create gmp-frontend-sa && \
gcloud iam service-accounts add-iam-policy-binding \
  --role roles/iam.workloadIdentityUser \
  --member "serviceAccount:$PROJECT_ID.svc.id.goog[$NAMESPACE_NAME/default]" \
  gmp-frontend-sa@$PROJECT_ID.iam.gserviceaccount.com \
&&
kubectl annotate serviceaccount \
  --namespace $NAMESPACE_NAME \
  default \
  iam.gke.io/gcp-service-account=gmp-frontend-sa@$PROJECT_ID.iam.gserviceaccount.com

gcloud projects add-iam-policy-binding $PROJECT_ID \
  --member=serviceAccount:gmp-frontend-sa@$PROJECT_ID.iam.gserviceaccount.com \
  --role=roles/monitoring.viewer
