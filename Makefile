docker-build: 
	docker build \
		--rm -t ezavvari/shape_comp_net .

docker-run:
	docker container run --rm \
		-e DOCKER_CONTAINER_NAME=MY_CONTAINER_NAME \
		--gpus all \
		-v `pwd`:`pwd` \
		--name Ubuntu-18 \
		-it \
		--workdir /home/elyar/thesis/ \
		ezavvari/shape_comp_net
