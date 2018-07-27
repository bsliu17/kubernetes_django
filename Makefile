NAME=$(shell basename $(CURDIR) | tr A-Z a-z)
UNAME=$(shell basename $(CURDIR) | tr a-z A-Z)
PKG=gitlab.com/bsliu17/$(NAME)
VERSION ?= $(shell git describe --always --dirty)

BRANCH ?= $(shell git rev-parse --abbrev-ref HEAD)
HOSTNAME := gcr.io/
G_PROJECT_ID := master-plane-211214
REPO := $(HOSTNAME)/$(G_PROJECT_ID)/$(NAME)

build:
	docker build -t bryan/k8_django_minikube:1.0.0 .

push:
	docker tag $(NAME) $(REPO):$(VERSION) 
	docker push $(REPO):$(VERSION) 

