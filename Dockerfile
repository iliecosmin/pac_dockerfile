FROM ubuntu:18.04
LABEL name="PACglobal"

#ENV PACGLOBAL_VERSION 2.2.0.0
SHELL [ "/bin/bash", "-o", "pipefail", "-c" ]

ADD https://github.com/PACGlobalOfficial/PAC/releases/download/b5cdfa551/pacglobal-v0.14.0.4-b5cdfa551-lin64.tgz /
ADD https://raw.githubusercontent.com/bulwark-crypto/Bulwark-Docker/master/bulwark/scripts/entrypoint.sh /usr/local/bin/

RUN apt-get update \
  && sudo apt-get -y update
  && sudo apt-get -y install git python virtualenv ufw pwgen nano vim git python-virtualenv cron apt-utils dialog wget locales \
  && apt-get clean \
  && tar xzvf pacglobal-v0.14.0.4-b5cdfa551-lin64.tgz \
  && cp -R pacglobal-v0.14.0.4-b5cdfa551-lin64/* /usr/local/bin/ \
  && chmod +x /usr/local/bin/* \
  && rm pacglobal-v0.14.0.4-b5cdfa551-lin64.tgz \
  && chmod a+x /usr/local/bin/entrypoint.sh \

USER root
VOLUME [ "/root/.pacglobal" ]
EXPOSE 7112
ENTRYPOINT [ "/usr/local/bin/entrypoint.sh" ]
