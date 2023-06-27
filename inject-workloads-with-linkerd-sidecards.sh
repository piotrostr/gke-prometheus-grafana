#!/bin/bash

kubectl get -n workloads deploy -o yaml \
  | linkerd inject - \
  | kubectl apply -f -

