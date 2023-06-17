#!/bin/bash

kubectl -n grafana port-forward svc/grafana 3000
