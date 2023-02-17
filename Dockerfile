FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y && \
  apt-get -y install \
  build-essential \
  gfortran \
  autoconf \
  cmake \
  clang \
  ninja-build \
  libblas-dev \
  liblapack-dev \
  libgmp-dev \
  libgsl-dev \
  libpng-dev \
  git \
  libfftw3-dev \
  libhdf5-dev \
  hdf5-tools \
  libpython3-dev \
  python3-pip \
  libtool && \
  add-apt-repository ppa:deadsnakes/ppa && \
  apt-get update -y && \
  apt-get install -y python3.9

ENV \
    CC="/usr/bin/clang" \
    CXX="/usr/bin/clang++"

RUN mkdir ~/install && \
    cd ~/install && \
    git clone https://github.com/HomerReid/libGDSII.git && \
    cd libGDSII/ && \
    chmod 777 autogen.sh && \
    sh autogen.sh && \
    make && \
    make install


RUN pip3 install Cython pytest cppyy numpy matplotlib

