#!/bin/sh

kubectl --namespace gitlab delete configmap gitlab-runner
kubectl --namespace gitlab delete deployment gitlab-runner
kubectl create -f runner-configmap.yaml
kubectl create -f runner-deploment.yaml
