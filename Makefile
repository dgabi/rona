all: docker-image

docker-image:
	jupyter nbconvert --ClearOutputPreprocessor.enabled=True --inplace notebooks/rona.ipynb
	jupyter nbconvert --ClearOutputPreprocessor.enabled=True --inplace notebooks/Age-group.ippynb
	(docker build -t rona:1.0 .)
