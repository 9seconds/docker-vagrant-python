# Makefile for building base vagrant images with Python
# Basically 'all' target is what you want.


# -----------------------------------------------------------------------------

ROOT_DIR := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

DOCKER_CMD := docker

NAME_TAG  := nineseconds
IMAGE_TAG := $(NAME_TAG)/vagrant-docker-python

PYTHONS_TARGETS := $(wildcard */)

.PHONY: $(PYTHONS_TARGETS)

# -----------------------------------------------------------------------------

all: $(PYTHONS_TARGETS)

# -----------------------------------------------------------------------------

$(PYTHONS_TARGETS):
	@$(DOCKER_CMD) build -t $(IMAGE_TAG):$(notdir $(@D)) $(ROOT_DIR)/$@
