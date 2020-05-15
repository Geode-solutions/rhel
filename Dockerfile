
# Pull base image.
FROM centos:7

# Install.
RUN \
  yum update -y && \
  yum install -y git gcc gcc-c++ make curl wget bzip2 python2-devel mesa-libGL-devel libXt-devel libX11-devel openssl-devel && \
  curl -sL https://rpm.nodesource.com/setup_12.x | bash - && \
  yum install -y nodejs && \
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
