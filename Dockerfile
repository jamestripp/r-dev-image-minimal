FROM mcr.microsoft.com/devcontainers/cpp:0-ubuntu-22.04

ARG REINSTALL_CMAKE_VERSION_FROM_SOURCE="none"

# Optionally install the cmake for vcpkg
COPY ./reinstall-cmake.sh /tmp/

RUN if [ "${REINSTALL_CMAKE_VERSION_FROM_SOURCE}" != "none" ]; then \
    chmod +x /tmp/reinstall-cmake.sh && /tmp/reinstall-cmake.sh ${REINSTALL_CMAKE_VERSION_FROM_SOURCE}; \
    fi \
    && rm -f /tmp/reinstall-cmake.sh

RUN apt update

RUN apt-get install -y build-essential gfortran gfortran zlib1g-dev \
    libbz2-dev libpcre2++-dev libcurl4-openssl-dev openjdk-8-jdk \
    liblzma-dev