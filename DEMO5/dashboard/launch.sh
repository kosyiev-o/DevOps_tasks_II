#!/bin/bash


kubectl apply -f dashboard.yaml
kubectl create serviceaccount dashboard-admin-sa
kubectl create clusterrolebinding dashboard-admin-sa --clusterrole=cluster-admin --serviceaccount=default:dashboard-admin-sa
kubectl describe secret dashboard-admin-sa-token
