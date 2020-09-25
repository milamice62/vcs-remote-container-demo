# Multi-stage docker build
FROM golang AS builder
# Copy the local package files
ADD . /go/src
# Set working directory
WORKDIR /go/src
# Compile go module
RUN GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build -o goapp

FROM alpine:latest
RUN apk --no-cache update \
    && apk --no-cache add sudo
# Non-root User
RUN sudo addgroup -S gouser && sudo adduser -S gouser -G gouser
# Copy compiled executable from previous stage
WORKDIR /app
COPY --from=builder /go/src/goapp .

EXPOSE 8080
USER gouser
ENTRYPOINT [ "./goapp" ]

