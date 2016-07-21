all: build push

build:
	docker build -t jcderr/concourse-packer-resource:latest .

push:
	docker push jcderr/concourse-packer-resource:latest
