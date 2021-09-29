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
```

## Docker & Java
```
docker build --build-arg JAR_FILE=target/robxx-app-1.0-SNAPSHOT.jar -t robxx/robxx-app:0.1 .

docker run -d --name robxx-app -p 8080:8080 robxx/robxx-app:0.1

docker logs robxx-app

docker exec -it robxx-app /bin/bash

docker stop robxx-app

docker rm robxx-app
```

## Docker & Java - Multi Stage Builds
```
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