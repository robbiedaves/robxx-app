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
docker run -ti --entrypoint /bin/sh ubuntu

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

docker build -f multi.Dockerfile -t robxx/robxx-app:0.1 .

docker run -d --name robxx-app-multi -p 8080:8080 robxx/robxx-app:0.1

docker logs robxx-app-multi

docker exec -it robxx-app-multi /bin/bash

docker stop robxx-app-multi

docker rm robxx-app-multi
```


## Other Commands
```
docker container prune
```