FROM docker.pkg.github.com/dock0/pkgforge/pkgforge:latest
RUN pacman -S --needed --noconfirm bc python-pip inetutils cpio
RUN REQUESTS_CA_BUNDLE=/etc/ssl/cert.pem pip install roller
