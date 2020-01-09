
# Pull base image.
FROM centos:7

# Install.
RUN \
  yum update -y && \
  yum install -y git gcc gcc-c++ make wget && \
  wget https://cmake.org/files/v3.12/cmake-3.12.3.tar.gz && \
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
