export GIT_REVISION=$(shell git rev-parse --short HEAD)

REGISTRY = docker.io
REPOSITORY = bluebeluga/registry

PUSH_REGISTRIES = $(REGISTRY)
