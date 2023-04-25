# Pull base image.
FROM quay.io/pypa/manylinux2014_x86_64

# Install.
RUN \
  yum install -y epel-release yum-utils && \
  curl -sL https://rpm.nodesource.com/setup_14.x | bash - && \
  yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo \
  yum update -y && \
  yum install -y dnf zlib-devel openssl-static ninja-build valgrind-devel nodejs docker-ce docker-ce-cli containerd.io

# Set environment variables.
ENV HOME /root

# Define working directory.
WORKDIR /root

# Define default command.
CMD ["bash"]
