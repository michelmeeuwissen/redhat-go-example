FROM registry.access.redhat.com/ubi8/go-toolset as build

USER root

COPY . .

RUN go mod tidy && \
    go build .

FROM registry.access.redhat.com/ubi8/ubi-minimal

COPY --from=build /opt/app-root/src/redhat-go-example .

RUN ./redhat-go-example
