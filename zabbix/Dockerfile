
FROM zabbix/zabbix-server-mysql:alpine-latest

RUN apk update && \
    apk add py-pip git

RUN set -x && \
  pip install pip --upgrade && \
  pip install git+https://github.com/alerta/zabbix-alerta
# RUN ln -s /usr/bin/zabbix-alerta /usr/lib/zabbix/alertscripts/ && \
#   chmod +x /usr/lib/zabbix/alertscripts/zabbix-alerta

COPY zabbix-alerta /usr/lib/zabbix/alertscripts/

# ENV ALERTA_CONF_FILE /root/alerta.conf

# RUN echo "ALERTA_CONF_FILE=/root/alerta.conf" >>/etc/default/zabbix-server
# ADD ./config/alerta.conf /root/alerta.conf

# copy alerta.conf zabbix profile
