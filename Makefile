all: docker-image

docker-image:
	(docker build -t rona:1.0 .)
