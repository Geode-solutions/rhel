# Pull base image.
FROM quay.io/pypa/manylinux2014_x86_64

# Install.
RUN \
  yum install -y epel-release yum-utils && \
  curl -sL https://rpm.nodesource.com/setup_14.x | bash - && \
  yum update -y && \
  yum install -y dnf wget ninja-build valgrind-devel nodejs && \
  wget https://www.openssl.org/source/openssl-1.1.1t.tar.gz && \
  tar -xzf openssl-1.1.1t.tar.gz && \
  cd openssl-1.1.1t && \
  ./config no-shared no-comp && \
  make -j && make install && \
  cd .. && rm -rf openssl-1.1.1t*

# Set environment variables.
ENV HOME /root

# Define working directory.
WORKDIR /root

# Define default command.
CMD ["bash"]
