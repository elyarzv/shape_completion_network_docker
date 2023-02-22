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
		--workdir /$$HOME/thesis/shape_completion_network_docker \
		ezavvari/shape_comp_net

install-shape-comp-net:
	pip install -e . && \
	cp binvox_rw.py /usr/lib/python2.7/dist-packages/ && \
	cp binvox_rw.py src/shape_reconstruction/shape_completion
