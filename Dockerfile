
# Pull base image.
FROM centos:7

# Install.
RUN \
  yum update -y && \
  yum install -y git gcc gcc-c++ make wget python2-devel mesa-libGL-devel libXt-devel libX11-devel openssl-devel && \
  wget https://cmake.org/files/v3.15/cmake-3.15.0.tar.gz && \
  tar zxvf cmake-3.* && \
  cd cmake-3.* && \
  ./bootstrap --prefix=/usr/local && \
  make -j$(nproc) && \
  make install

# Set environment variables.
ENV HOME /root

# Define working directory.
WORKDIR /root

# Define default command.
CMD ["bash"]
