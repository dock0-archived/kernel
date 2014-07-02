FROM dock0/arch
MAINTAINER akerl <me@lesaker.org>
RUN pacman -Syu --needed --noconfirm base-devel bc python-pip ruby openssh
RUN pip install roller
RUN gem install --no-user-install targit
WORKDIR /opt/kernels
CMD ["make", "local"]
