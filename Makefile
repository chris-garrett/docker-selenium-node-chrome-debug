
IMAGE_VERSION=3.10.0
IMAGE_NAME=chrisgarrett/selenium-node-chrome-debug

all: build

prep:
	IMAGE_VERSION=${IMAGE_VERSION} IMAGE_NAME=${IMAGE_NAME} envsubst '$${IMAGE_VERSION} $${IMAGE_NAME}' < ./templates/Dockerfile.template > Dockerfile
	IMAGE_VERSION=${IMAGE_VERSION} IMAGE_NAME=${IMAGE_NAME} envsubst '$${IMAGE_VERSION} $${IMAGE_NAME}' < ./templates/README.md.template > README.md

build: prep
	docker build --rm=true -t ${IMAGE_NAME}:${IMAGE_VERSION} .

run:
	docker run --rm -it \
		-v `pwd`/downloads:/home/seluser/downloads \
		${IMAGE_NAME}:${IMAGE_VERSION} \
		bash
