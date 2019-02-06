PROJECTS = fruits-service users-service api-gateway
DOCKER_TARGETS = docker_build docker_tag docker_push

all: build 
docker: $(DOCKER_TARGETS)

build: $(PROJECTS)
$(PROJECTS):
	$(MAKE) -C $@ $(MAKECMDGOALS)

$(DOCKER_TARGETS): $(PROJECTS)
$(PROJECTS):
	$(MAKE) -C $@ $(MAKECMDGOALS)

.PHONY: build $(DOCKER_TARGETS) $(PROJECTS)
