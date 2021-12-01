FROM ubuntu:focal

LABEL org.opencontainers.image.source=https://github.com/kylep/kubelet

ADD image-files/ /

RUN apt-get update \
 && apt-get install -y \
      apt-transport-https \
      ca-certificates \
      curl \
      wget \
  && curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg \
  && echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" > /etc/apt/sources.list.d/kubernetes.list \
  && apt-get update \
  && apt-get install -y kubectl \
  && wget https://github.com/kubernetes-sigs/kubefed/releases/download/v0.9.0/kubefedctl-0.9.0-linux-amd64.tgz \
  && tar -zxvf kubefedctl-0.9.0-linux-amd64.tgz \
  && rm kubefedctl-0.9.0-linux-amd64.tgz \
  && mv kubefedctl /usr/local/bin/

CMD tail -f /dev/null
