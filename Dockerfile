# Pull base image.
FROM quay.io/pypa/manylinux2014_x86_64

# Install.
RUN \
  yum install -y epel-release && \
  curl -sL https://rpm.nodesource.com/setup_16.x | bash - && \
  yum update -y && \
  yum install -y openssl-devel openssl-static valgrind-devel nodejs

# Set environment variables.
ENV HOME /root

# Define working directory.
WORKDIR /root

# Define default command.
CMD ["bash"]
