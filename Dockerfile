FROM golang:1.12.0 AS builder
WORKDIR /opt/pi-docker
COPY ./ .
#RUN make build-go-arm
# While we're here in amd64, download the qemu-arm-static binary for the arm image in the next build step
RUN curl -O -L https://github.com/multiarch/qemu-user-static/releases/download/v4.0.0/qemu-aarch64-static 

FROM aarch64/ubuntu:latest
# Copy across the qemu binary that was downloaded in the previous build step
COPY --from=builder /opt/pi-docker/qemu-aarch64-static /usr/bin
RUN apk add nmap
RUN ["/usr/bin/qemu-aarch64-static", "apt-get", "update"] 
RUN ["/usr/bin/qemu-aarch64-static", "apt-get", "-y", "upgrade"] 
#COPY --from=builder /go/src/github.com/medols/pi-docker/hue-im-home_arm /hue-im-home
#RUN chmod +x /hue-im-home && mkdir /config
ENTRYPOINT ["/bin/bash"]
