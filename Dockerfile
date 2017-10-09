FROM ubuntu:trusty

LABEL Maintainer="Tim Bowden <tim.bowden@mapforge.com.au>"
LABEL version=0.1

ENV TERM xterm-256color

RUN apt-get update && apt-get install -y \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

RUN pip3 install virtualenvwrapper

RUN echo "source /usr/local/bin/virtualenvwrapper.sh" >> /etc/bash.bashrc

ENV WORKON_HOME /data/web_projects/python_apps/virtualenvs
ENV PROJECT_HOME /data/web_projects/python_apps/projects
ENV VIRTUALENVWRAPPER_PYTHON /usr/bin/python3

RUN adduser --gecos  webdev --disabled-password webdev

RUN mkdir -p /data/web_projects/
RUN chown webdev:webdev /data/web_projects
USER webdev

WORKDIR /data/web_projects/
RUN mkdir -p python_apps/virtualenvs
RUN mkdir python_apps/projects

RUN ["/bin/bash", "-c", "source /usr/local/bin/virtualenvwrapper.sh"]

