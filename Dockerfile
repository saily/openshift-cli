FROM frolvlad/alpine-glibc:latest

MAINTAINER Daniel Widerin <daniel@widerin.net>

ARG OC_VERSION=4.9.9
ARG BUILD_DEPS='tar gzip'
ARG RUN_DEPS='curl ca-certificates gettext'

RUN apk --no-cache add $BUILD_DEPS $RUN_DEPS && \
    curl -sLo /tmp/oc.tar.gz https://mirror.openshift.com/pub/openshift-v4/x86_64/clients/ocp/$OC_VERSION/openshift-client-linux.tar.gz && \
    tar xzvf /tmp/oc.tar.gz -C /usr/local/bin/ && \
    rm -rf /tmp/oc.tar.gz && \
    apk del $BUILD_DEPS

CMD ["/usr/local/bin/oc"]

