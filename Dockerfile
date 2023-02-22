# This is an auto generated Dockerfile for ros:ros-core
# generated from docker_images/create_ros_core_image.Dockerfile.em
FROM ubuntu:bionic
# FROM ubuntu:xenial

# Set the frontend to noninteractive
ENV DEBIAN_FRONTEND=noninteractive

# Update apt-get and install apt-utils
RUN apt-get update && apt-get install -y apt-utils

# Install packages from a list
COPY apt-packages.txt /tmp/
RUN xargs -a /tmp/apt-packages.txt apt-get install -y

# Clean up
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Reset the frontend to its default value
ENV DEBIAN_FRONTEND=dialog


# Copy the list of pip packages
COPY requirements.txt /tmp/requirements.txt

# Install pip packages
RUN pip install -r /tmp/requirements.txt

# Clean up
RUN rm /tmp/requirements.txt

RUN pip install -e git+https://github.com/CRLab/python-pcl.git#egg=python-pcl
RUN pip install pymcubes==0.0.2

# setup timezone
# RUN echo 'Etc/UTC' > /etc/timezone && \
#     ln -s /usr/share/zoneinfo/Etc/UTC /etc/localtime

# setup keys
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654

# setup environment
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

# setup entrypoint
COPY ./entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
CMD ["bash"]
