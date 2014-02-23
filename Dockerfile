FROM akerl/arch
MAINTAINER akerl <me@lesaker.org>
RUN pacman -Syu --needed --noconfirm base-devel bc python-pip
RUN pip install roller
RUN git clone git://github.com/akerl/kernels /opt/configs
CMD ["roller.py", "-v", "-s", "-n", "next", "-b", "/opt"]
