# Pull base image.
FROM quay.io/pypa/manylinux2014_x86_64

# Install.
RUN \
  yum install -y epel-release && \
  yum update -y && \
  yum install -y openssl-devel openssl-static valgrind-devel dnf && \
  dnf module install nodejs:16

# Set environment variables.
ENV HOME /root

# Define working directory.
WORKDIR /root

# Define default command.
CMD ["bash"]
