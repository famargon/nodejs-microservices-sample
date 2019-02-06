PROJECT_PREFIX  = microservices
PROJECT_NAME    ?= $(shell basename $(CURDIR))

DOCKER_REGISTRY = 172.30.1.1:5000
OCP_PROJECT = microservices
DOCKER          = docker
TAG             ?= latest
PROJECT_TAG_NAME = $(DOCKER_REGISTRY)/$(OCP_PROJECT)/$(PROJECT_NAME):$(TAG)

docker: docker_build docker_tag docker_push

docker_build:
	if [ -f Dockerfile ]; then $(DOCKER) build -t $(PROJECT_PREFIX)-$(PROJECT_NAME) . ; fi
	if [ -f Dockerfile ]; then docker images | grep $(PROJECT_PREFIX)-$(PROJECT_NAME) ; fi

docker_tag:
	if [ -f Dockerfile ]; then $(DOCKER) tag $(PROJECT_PREFIX)-$(PROJECT_NAME) $(PROJECT_TAG_NAME) ; fi

docker_push:
	if [ -f Dockerfile ]; then $(DOCKER) push $(PROJECT_TAG_NAME); fi