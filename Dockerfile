FROM dock0/arch:f4c0d1f00e86
MAINTAINER akerl <me@lesaker.org>
RUN pacman -Syu --needed --noconfirm base-devel bc python-pip ruby
RUN pip install roller==0.4.7
RUN gem install --no-user-install gist
ADD autorun.sh /opt/autorun.sh
CMD ["/opt/autorun.sh"]
