FROM akerl/arch
MAINTAINER akerl <me@lesaker.org>
RUN pacman -Syu --needed --noconfirm base-devel bc python-pip
RUN pip install roller==0.4.7
RUN git clone git://github.com/akerl/kernels /opt/configs
ADD autorun.sh /opt/autorun.sh
CMD ["/opt/autorun.sh"]
