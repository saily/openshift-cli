FROM frolvlad/alpine-glibc:latest

MAINTAINER Daniel Widerin <daniel@widerin.net>

ARG OC_VERSION=4.2 \
    BUILD_DEPS='tar gzip' \
    RUN_DEPS='curl ca-certificates gettext'

RUN apk --no-cache add $BUILD_DEPS $RUN_DEPS && \
    curl -sLo /tmp/oc.tar.gz https://mirror.openshift.com/pub/openshift-v$(echo $OC_VERSION | cut -d'.' -f 1)/clients/oc/$OC_VERSION/linux/oc.tar.gz && \
    tar xzvf /tmp/oc.tar.gz -C /usr/local/bin/ && \
    rm -rf /tmp/oc.tar.gz && \
    apk del $BUILD_DEPS

CMD ["/usr/local/bin/oc"]

