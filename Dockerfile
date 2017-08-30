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
    && apt-get -qq update \
    && apt-get -qq --no-install-recommends install $buildDeps \
    && rm -rf /var/lib/apt/lists/* \
    \
    && mkdir -p /usr/local/src/xmr-stak-amd/build \
    && cd /usr/local/src/xmr-stak-amd/ \
    && curl -sL https://github.com/fireice-uk/xmr-stak-amd/archive/$XMR_STAK_AMD_VERSION.tar.gz | tar -xz --strip-components=1 
    
ENTRYPOINT ["xmr-stak-amd"]
CMD ["/usr/local/etc/config.txt"]
