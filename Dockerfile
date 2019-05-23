FROM aarch64/ubuntu:latest

ADD http://curl.haxx.se/ca/cacert.pem /tmp

ADD https://github.com/multiarch/qemu-user-static/releases/download/v4.0.0/qemu-aarch64-static /usr/bin/qemu-aarch64-static

ADD setup.sh /tmp/setup.sh

ENV SSL_CERT_FILE=/tmp/cacert.pem 

RUN /tmp/setup.sh

CMD bash

