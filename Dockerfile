# Dockerfile for SavageWiki
#
# Based on https://peppe8o.com/personal-mediawiki-with-raspberry-pi-and-docker/
#
# Written and performed by @securitysavage

FROM debian
RUN apt update && apt install mariadb-server -y
RUN sed -i 's/bind-address/bind-address = 0.0.0.0 #/i' /etc/mysql/mariadb.conf.d/50-server.cnf
RUN mkdir /scripts
COPY savagescript.sql /scripts/
RUN /etc/init.d/mysql start && mysql -uroot --password="" -e "source /scripts/savagescript.sql"
CMD /etc/init.d/mysql start && tail -f /dev/null
