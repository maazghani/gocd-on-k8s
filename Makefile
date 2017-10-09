.PHONY: build release test

DOCKER_REPO=maazghani/
VERSION=$(shell git rev-parse --short HEAD)

build:
	docker build -t ${DOCKER_REPO}gocd-server:${VERSION} gocd-server
	docker build -t ${DOCKER_REPO}gocd-agent:${VERSION} gocd-agent

release: build
	VERSION=$(git rev-parse --short HEAD)
	docker login
	docker push ${DOCKER_REPO}gocd-server:${VERSION}
	docker push ${DOCKER_REPO}gocd-agent:${VERSION}

test: build
	test
