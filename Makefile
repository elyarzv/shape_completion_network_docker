docker-build: 
	docker build \
		--rm -t ezavvari/shape_comp_net .

docker-run:
	docker container run --rm \
		-e DOCKER_CONTAINER_NAME=MY_CONTAINER_NAME \
		--gpus all \
		-v `pwd`:`pwd` \
		--name shape_comp_net_container \
		-it \
		--workdir /home/elyar/thesis/ \
		ezavvari/shape_comp_net
