#!/bin/bash

kubectl get ns prometheus || kubectl create ns prometheus
kubectl get ns grafana || kubectl create ns grafana

kubectl apply -n prometheus -f prometheus-frontend.yaml
kubectl apply -n grafana -f grafana.yaml
