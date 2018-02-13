.PHONY: clean build run stop inspect

IMAGE_NAME     = cynay/docker-alpine-python3-flask
CONTAINER_NAME = flask-app

build:
	docker build -t $(IMAGE_NAME) .

release:
	docker build \
		--build-arg BUILD_DATE=`date -u +"%Y-%m-%dT%H:%M:%SZ"` -t $(IMAGE_NAME) .

run:
	docker run -d --rm -p 443:80 --name $(CONTAINER_NAME) $(IMAGE_NAME)

inspect:
	docker inspect $(CONTAINER_NAME)

shell:
	docker exec -it $(CONTAINER_NAME) /bin/sh

stop:
	docker stop $(CONTAINER_NAME)

clean:
	docker ps -a | grep '$(CONTAINER_NAME)' | awk '{print $$1}' | xargs docker rm \
	docker images | grep '$(IMAGE_NAME)' | awk '{print $$3}' | xargs docker rmi
