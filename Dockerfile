# Pull base image.
FROM quay.io/pypa/manylinux_2_28_x86_64

# Install.
RUN \
  yum install -y epel-release yum-utils && \
  curl -sL https://rpm.nodesource.com/setup_20.x | bash - && \
  yum update -y && \
  yum install -y dnf wget ninja-build zstd valgrind-devel nodejs openssl-devel && \
  dnf install -y 'dnf-command(config-manager)' && \
  dnf config-manager --add-repo https://cli.github.com/packages/rpm/gh-cli.repo && \
  dnf install -y gh

# Set environment variables.
ENV HOME /root

# Define working directory.
WORKDIR /root

# Define default command.
CMD ["bash"]
