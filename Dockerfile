FROM dock0/arch
MAINTAINER akerl <me@lesaker.org>
RUN pacman -Syu --needed --noconfirm base-devel bc python-pip ruby
RUN pip install roller==0.4.7
RUN gem install --no-user-install gist
RUN git clone git://github.com/akerl/kernels /opt/configs
ADD autorun.sh /opt/autorun.sh
CMD ["/opt/autorun.sh"]
