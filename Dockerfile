FROM ubuntu:trusty
LABEL maintainer="jdlang"

# Prevent dpkg errors
ENV TERM=xterm-256color

# set mirror
RUN sed -i "s/http:\/\/archive./http:\/\/uk.archive./g" /etc/apt/sources.list

# install ansible
RUN apt-get update -qy && \
    apt-get install -qy software-properties-common && \
    apt-add-repository -y ppa:ansible/ansible && \
    apt-get update -qy && \
    apt-get install -qy ansible

VOLUME /ansible
WORKDIR /ansible

# entrypoint
ENTRYPOINT [ "ansible-playbook" ]
CMD ["site.yml"]