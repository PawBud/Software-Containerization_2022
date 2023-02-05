#!/bin/bash



echo "Docker image deployement"

cd ./backend 

docker build -t sof_con_backend .

cd ..

cd ./frontend

docker build -t sof_con_frontend .

cd ..

docker pull mongo 

echo "Start Minikube"
minikube start

echo "PV"

kubectl apply -f pv.yaml

echo "helm deployement"

curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh

helm install -f  antiracismapp.yaml antiracismapp-frontend-helm /Users/punyakapoor/Documents/Software-Containerization_2022/og/Software-Containerization_2022/antiracismapp
helm install -f  antiracismapp_backend.yaml antiracismapp-backend-helm /Users/punyakapoor/Documents/Software-Containerization_2022/og/Software-Containerization_2022/antiracismapp
helm install -f  antiracismapp-db.yaml antiracismapp-db-helm /Users/punyakapoor/Documents/Software-Containerization_2022/og/Software-Containerization_2022/antiracismapp

echo "Helm upgrade"

helm upgrade -f ./antiracismapp-db/values.yaml -f ./antiracismapp-db/override.yaml antiracismapp-db ./antiracismapp-db

echo "helm uninstall"

helm uninstall antiracism-db

echo "view the deployements"

minikube dashboard 
