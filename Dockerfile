FROM dock0/pkgforge
RUN pacman -S --needed --noconfirm bc python-pip
RUN REQUESTS_CA_BUNDLE=/etc/ssl/cert.pem pip install roller
