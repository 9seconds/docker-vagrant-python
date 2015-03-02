# Makefile for building base vagrant images with Python
# Basically 'all' target is what you want.


# -----------------------------------------------------------------------------

ROOT_DIR := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

DOCKER_CMD := docker

NAME_TAG  := nineseconds
IMAGE_TAG := $(NAME_TAG)/docker-vagrant-python

PYTHONS_TARGETS := $(wildcard */)

.PHONY: $(PYTHONS_TARGETS)

# -----------------------------------------------------------------------------

all: $(PYTHONS_TARGETS)
	$(eval IMAGE_27_ID := $(shell $(DOCKER_CMD) images | grep $(IMAGE_TAG) | awk '$$2 == 2.7 {print $$3}') )
	$(DOCKER_CMD) tag -f $(IMAGE_27_ID) $(IMAGE_TAG):2 && \
	$(DOCKER_CMD) tag -f $(IMAGE_27_ID) $(IMAGE_TAG):latest
	$(eval IMAGE_34_ID := $(shell $(DOCKER_CMD) images | grep $(IMAGE_TAG) | awk '$$2 == 3.4 {print $$3}') )
	$(DOCKER_CMD) tag -f $(IMAGE_34_ID) $(IMAGE_TAG):3

push: all
	$(DOCKER_CMD) push $(IMAGE_TAG)

$(PYTHONS_TARGETS):
	$(DOCKER_CMD) build -t $(IMAGE_TAG):$(notdir $(@D)) $(ROOT_DIR)/$@
