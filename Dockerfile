# This is an auto generated Dockerfile for ros:ros-core
# generated from docker_images/create_ros_core_image.Dockerfile.em
FROM ubuntu:bionic



# setup timezone
RUN echo 'Etc/UTC' > /etc/timezone && \
    ln -s /usr/share/zoneinfo/Etc/UTC /etc/localtime && \
    apt-get update && \
    apt-get install -q -y --no-install-recommends tzdata && \
    rm -rf /var/lib/apt/lists/*

# install packages
RUN apt-get update && apt-get install -q -y --no-install-recommends \
    dirmngr \
    gnupg2 \
    && rm -rf /var/lib/apt/lists/*



# setup keys
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654


#COPY get-pipp.py /root/get-pipp.py



RUN apt update -y && \
    apt-get install apt-utils -y && \
    apt install wget -y && \
    apt-get update && \
    apt-get install zip unzip -y && \
    apt-get install software-properties-common -y && \
    apt install build-essential -y && \
    apt-get -y install python3-pip && \
    apt update && \
#    apt install python3-pip && \
    
    # installing pip
    wget https://bootstrap.pypa.io/pip/2.7/get-pip.py && \
    chmod +x get-pip.py && \
    python3 get-pip.py && \
    rm -rf get-pip.py && \
    
    pip install pcl && \
    # the following packages are needed for binvox
    apt install libglu1-mesa -y && \
    apt install libxmu6 -y && \
    pip install PyYAML && \
    pip install cython && \
    pip install plyfile && \
    

    
# setup environment
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

ENV ROS_DISTRO melodic



    

# setup entrypoint
COPY ./ros_entrypoint.sh /





RUN pip install torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cu116 && \
    pip install future 



ENTRYPOINT ["/ros_entrypoint.sh"]
CMD ["bash"]
