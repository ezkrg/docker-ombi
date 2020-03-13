FROM debian:buster-slim

COPY ombi.tar.gz /tmp/

RUN groupadd -g 999 ombi \
 && useradd -m -d /opt/ombi -r -u 999 -g 999 ombi \
 && apt-get update \
 && apt-get install -y libicu63 libunwind8 libcurl4 \
 && tar -xzf /tmp/ombi.tar.gz -C /opt/ombi \
 && chmod +x /opt/ombi/Ombi \
 && chown ombi:ombi -R /opt/ombi \
 && rm -rf /tmp/* \
 && apt-get clean \
 && rm -rf /var/cache/apt/*

WORKDIR /opt/ombi

USER ombi

ENTRYPOINT [ "/opt/ombi/Ombi" ]

CMD [ "--version" ]