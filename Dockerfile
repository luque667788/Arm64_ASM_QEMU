# Use Ubuntu 20.04.1 LTS as the base image
FROM ubuntu:20.04

RUN ln -snf /usr/share/zoneinfo/$CONTAINER_TIMEZONE /etc/localtime && echo $CONTAINER_TIMEZONE > /etc/timezone

RUN apt update && \
    apt install -q -y \
    qemu-user \
    qemu-user-static \
    gcc-aarch64-linux-gnu \
    binutils-aarch64-linux-gnu \
    binutils-aarch64-linux-gnu-dbg \
    gdb-multiarch \
    tmux \
    nano \
    build-essential

RUN mkdir -p /home/arm64
# Set the working directory to the home folder
WORKDIR /home/arm64

# Copy all files from the current directory on the host into /home in the container
COPY . /home/arm64

RUN chmod +x run_debug.sh


# Set the default command to bash
CMD ["/bin/bash"]