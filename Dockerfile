FROM alpine:latest
MAINTAINER Joeri van Dooren <ure@mororless.be>

ADD scripts/run.sh /scripts/run.sh

RUN apk --no-cache add --update tar rsync openssl ca-certificates curl bash && apk upgrade i

WORKDIR /scripts

ENTRYPOINT ["/scripts/run.sh"]

# Set labels used in OpenShift to describe the builder images
LABEL io.k8s.description="Alpine linux shell" \
      io.k8s.display-name="alpine curl tar" \
      io.openshift.tags="builder,pvc,tar" \
      io.openshift.min-memory="1Gi" \
      io.openshift.min-cpu="1" \
      io.openshift.non-scalable="false"
