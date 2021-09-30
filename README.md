# robxx-app

## Java REST App
To run the application
```
mvn clean

mvn  package

java -jar target/robxx-app-1.0-SNAPSHOT.jar

curl http://localhost:8080/hello
curl http://localhost:8080/actuator/health
```

## Docker
```
# List images
docker images
# List continers
docker ps

docker run -ti --entrypoint /bin/sh ubuntu

# Output distro info
cat /etc/os-release

docker pull centos
docker run -ti --entrypoint /bin/sh centos

# Output distro info
cat /etc/os-release

docker images
docker ps
docker ps -a
```

## Docker & Java
```
docker build --build-arg JAR_FILE=target/robxx-app-1.0-SNAPSHOT.jar -t robxx/robxx-app:0.1 .
docker images

docker run -d --name robxx-app -p 8080:8080 robxx/robxx-app:0.1

curl http://localhost:8080/hello

docker logs robxx-app

docker exec -it robxx-app /bin/bash
ls -l

# Run another container using the same image
docker run -d --name robxx-app-2 -p 8081:8080 robxx/robxx-app:0.1
docker ps
# Note IPs
curl http://localhost:8080/hello
curl http://localhost:8081/hello

docker stop robxx-app
docker stop robxx-app-2

docker rm robxx-app
docker rm robxx-app-2

docker ps -a
docker container prune
```

## Docker & Java - Multi Stage Builds
```
# Clean up target files
mvn clean

# Build using multi stage docker file
docker build -f multi.Dockerfile -t robxx/robxx-app:0.1 .

# Run container
docker run -d --name robxx-app-multi -p 8080:8080 robxx/robxx-app:0.1

docker logs robxx-app-multi

docker exec -it robxx-app-multi /bin/bash

docker stop robxx-app-multi

docker rm robxx-app-multi
```


## Build container for acr
```
# Loging to acr
docker login admcentralacr.azurecr.io -u <user> -p <password>

# package jar
mvn package

# Build docker images with acr tag
docker build -t admcentralacr.azurecr.io/robxx-app:0.1 .

# Push to acr
docker push admcentralacr.azurecr.io/robxx-app:0.1

```


## Kubernetes
```
# get k8s/aks creds
az login
az account set -s <subscription id>
az aks get-credentials -g adms-uksouth-sandpit-rg -n adms-uksouth-sandpit-aks -a

# kubectl commands
kubectl get nodes
kubectl get pods -A

# Image pull secret
kubectl apply -f imagePullSecret.yaml
# List secrets
kubectl get secrets -n adms

# apply deployment
kubectl apply -f deployment.yaml
kubectl get pods -n adms
kubectl logs robxx-app-6ccb6644cb-lh7kl -n adms

kubectl get pods -n adms -o wide

kubectl apply -f service.yaml 
kubectl get service -n adms
# Get external IP and port for service and use in curl
curl 10.175.130.98:80/hello

# change replics in deployment
kubectl apply -f deployment.yaml
kubectl get pods -n adms
curl 10.175.130.98:80/hello


# Clean up
kubeclt delete -f service.yaml
kubectl delete -f deployment.yaml
kubectl delete -f imagePullSecret.yaml
```