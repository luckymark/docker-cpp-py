FROM ubuntu:18.04

RUN apt-get update -y
RUN apt-get -y install \
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
  libtool

RUN mkdir ~/install && \
    cd ~/install && \
    git clone https://github.com/HomerReid/libGDSII.git && \
    cd libGDSII/ && \
    chmod 777 autogen.sh && \
    sh autogen.sh && \
    make && \
    make install

#RUN apt-get -y install libfreetype6-dev
RUN pip3 install Cython pytest cppyy numpy matplotlib

