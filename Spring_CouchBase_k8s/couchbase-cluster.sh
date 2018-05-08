#!/bin/bash

minikube start

kubectl create -f cluster-master.yml

kubectl create -f cluster-worker.yml

kubectl create -f client-service.yml


