#!/bin/bash

kubectl get ns workloads || kubectl create ns workloads
kubectl get ns prometheus || kubectl create ns prometheus
kubectl get ns grafana || kubectl create ns grafana

kubectl apply -n prometheus -f prometheus-frontend.yaml
kubectl apply -n grafana -f grafana.yaml
kubectl apply -n workloads \
  -f sample-application.yaml \
  -f pod-monitoring-resource-for-the-sample-application.yaml
