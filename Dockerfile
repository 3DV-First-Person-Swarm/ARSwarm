FROM osrf/ros:humble-desktop-full
    
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    x11-apps \
    xterm \
    libxcb-xinerama0 \
    libxcb-cursor0 \
    libxkbcommon-x11-0 \
    usbutils \
    && rm -rf /var/lib/apt/lists/*


# install pip:
RUN apt-get update && apt-get install -y python3-pip

#udev setup
# Check if 'plugdev' group exists; if not, create it
RUN getent group plugdev || groupadd -r plugdev

WORKDIR /arswarm

# install dependencies:
RUN pip3 install colcon-common-extensions \
                numpy \
                cflib \
                zmq \
                pyyaml \
                cfclient


RUN echo 'alias cb2="colcon build --symlink-install"' >> ~/.bashrc

ENV DEBIAN_FRONTEND=dialog

WORKDIR /arswarm/ros2_ws

CMD ["bash"]