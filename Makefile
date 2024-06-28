PORT ?= 8000

ifeq ($(shell command -v podman 2> /dev/null),)
    CMD=docker
else
    CMD=podman
endif

docker-run:
	$(CMD) build . -t my-mkdocs-image
	$(CMD) run --rm --name my-mkdocs-image -v "$$(pwd)":/docs -p ${PORT}:${PORT} --entrypoint ash my-mkdocs-image:latest -c 'mkdocs serve -a 0.0.0.0:${PORT}'
