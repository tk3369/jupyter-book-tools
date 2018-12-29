FROM python:slim

# jupyter layer
RUN pip install jupyter 

# xelatex layer
RUN apt-get -y update && \
    apt-get -y install texlive-xetex && \
    apt-get -y install pandoc && \
    apt-get autoclean && apt-get --purge --yes autoremove && \ 
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* 

# /book is the mount point
# /usr/local/bin contains shell scripts
RUN mkdir /book && \
    mkdir -p /usr/local/bin 

COPY genbook /usr/bin/genbook
COPY welcome /usr/bin/welcome
COPY sample-booktemplate.tplx /etc/booktemplate.tplx

WORKDIR /book

CMD ["/usr/bin/welcome"]

