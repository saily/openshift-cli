FROM frolvlad/alpine-glibc:latest

MAINTAINER Daniel Widerin <daniel@widerin.net>

ENV OC_VERSION=v1.4.1 \
    OC_TAG_SHA=3f9807a \
    BUILD_DEPS='curl tar gzip'

RUN apk --no-cache add $BUILD_DEPS gettext && \
    curl -sLo /tmp/oc.tar.gz https://github.com/openshift/origin/releases/download/${OC_VERSION}/openshift-origin-client-tools-${OC_VERSION}-${OC_TAG_SHA}-linux-64bit.tar.gz && \
    tar xzvf /tmp/oc.tar.gz -C /tmp/ && \
    mv /tmp/openshift-origin-client-tools-${OC_VERSION}+${OC_TAG_SHA}-linux-64bit/oc /usr/bin/ && \
    rm -rf /tmp/oc.tar.gz /tmp/openshift-origin-client-tools-${OC_VERSION}+${OC_TAG_SHA}-linux-64bit && \
    apk del $BUILD_DEPS

CMD ["/bin/oc"]
