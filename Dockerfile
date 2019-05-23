FROM arm64v8/ubuntu:latest

#ADD http://curl.haxx.se/ca/cacert.pem /tmp

#ADD https://github.com/multiarch/qemu-user-static/releases/download/v4.0.0/qemu-aarch64-static /usr/bin

#ADD setup.sh /tmp/setup.sh

#ENV SSL_CERT_FILE=/tmp/cacert.pem 

#RUN [ "cross-build-start" ]

#RUN /tmp/setup.sh

#RUN locale-gen en_US.UTF-8

#RUN apt-get update

#RUN apt-get -y upgrade

#RUN apt-get update

#RUN chmod 777 /usr/bin/qemu-aarch64-static && ls -al /usr/bin/qemu-aarch64-static

RUN [ "/usr/bin/qemu-aarch64-static", "apt-get", "update" ]

RUN [ "/usr/bin/qemu-aarch64-static", "apt-get", "-y", "upgrade" ]

#RUN apt-get update && apt-get -y upgrade &&  apt-get -y install make clang-3.6 g++ ruby-dev libncurses-dev zlib1g-dev libssl-dev libedit-dev libncursesw5-dev git libatomic1 libedit2 libssl1.0-dev

#RUN ln -s /usr/bin/llvm-config-3.6 /usr/bin/llvm-config

#RUN mkdir -p /home/pi; cd /home/pi; git clone https://github.com/medols/rubinius.git; cd rubinius; LANG=en_US.UTF-8 LANGUAGE=en_US.UTF-8 LC_ALL=en_US.UTF-8 ./configure --prefix=/opt/rubinius/4.0 --llvm-config=llvm-config-3.6 --cc=clang-3.6 --cxx=clang++-3.6

#RUN LANG=en_US.UTF-8 LANGUAGE=en_US.UTF-8 LC_ALL=en_US.UTF-8 rake

#RUN [ "cross-build-end" ]

CMD bash
