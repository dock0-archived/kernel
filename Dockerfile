FROM dock0/pkgforge
RUN pacman -S --needed --noconfirm bc python-pip
RUN pip install roller
