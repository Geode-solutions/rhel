# Pull base image.
FROM quay.io/pypa/manylinux_2_28_x86_64

# Install.
RUN \
  yum install -y epel-release yum-utils && \
  curl -sL https://rpm.nodesource.com/setup_20.x | bash - && \
  yum update -y && \
  yum install -y dnf wget ninja-build zstd valgrind-devel nodejs && \
  dnf install -y 'dnf-command(config-manager)' && \
  dnf config-manager --add-repo https://cli.github.com/packages/rpm/gh-cli.repo && \
  dnf install -y gh

RUN \
  yum install -y perl-Pod-Html perl-IPC-Cmd && \  
  wget https://www.openssl.org/source/openssl-3.3.1.tar.gz && \
  tar -xzf openssl-3.3.1.tar.gz && \
  cd openssl-3.3.1 && \
  ./config no-shared no-comp && \
  make -j && make install && \
  cd .. && rm -rf openssl-3.3.1*

# Set environment variables.
ENV HOME /root

# Define working directory.
WORKDIR /root

# Define default command.
CMD ["bash"]
