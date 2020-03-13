FROM debian:buster-slim

COPY ombi.tar.gz /tmp/

RUN apt-get update \
 && apt-get install -y libicu63 libunwind8 libcurl4 \
 && mkdir /opt/ombi \
 && tar -xzf /tmp/ombi.tar.gz -C /opt/ombi \
 && chmod +x /opt/ombi/Ombi \
 && rm -rf /tmp/* \
 && apt-get clean \
 && rm -rf /var/cache/apt/*

 WORKDIR /opt/ombi

 ENTRYPOINT [ "/opt/ombi/Ombi" ]

 CMD [ "--version" ]