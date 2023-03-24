FROM registry.access.redhat.com/ubi8/go-toolset as build

USER root

COPY . .

RUN go mod tidy && \
    go build .

FROM registry.access.redhat.com/ubi8/ubi-micro

COPY --from=build /etc/pki/ca-trust/extracted/openssl/ca-bundle.trust.crt /etc/pki/ca-trust/source/anchors/ca-bundle.trust.crt
COPY --from=build /opt/app-root/src/redhat-go-example .

RUN ./redhat-go-example
