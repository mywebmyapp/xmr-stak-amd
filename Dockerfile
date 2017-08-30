FROM ubuntu:16.04

RUN apt-get update \
    && apt-get -qq --no-install-recommends install \
        libmicrohttpd10 \
        libssl1.0.0 \
        ocl-icd-opencl-dev \
        build-essential \
    && rm -r /var/lib/apt/lists/*

ENV XMR_STAK_AMD_VERSION v1.1.0-1.4.0

RUN set -x \
    && buildDeps=' \
        ca-certificates \
        curl \
        g++ \
        make \
        libmicrohttpd-dev \
        libssl-dev \ 
        cmake \
    ' \
    && apt-get -qq update 

ENTRYPOINT ["xmr-stak-amd"]
CMD ["/usr/local/etc/config.txt"]
