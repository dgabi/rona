all: docker-image

docker-image:
	jupyter nbconvert --ClearOutputPreprocessor.enabled=True --inplace notebooks/rona.ipynb
	(docker build -t rona:1.0 .)
