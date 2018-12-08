FROM clearwater/base
MAINTAINER maintainers@projectclearwater.org

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --force-yes sprout
RUN sed -e 's/\(echo 0 > \/proc\/sys\/kernel\/yama\/ptrace_scope\)/# \0/g' -i /etc/init.d/sprout
RUN apt-get install -y --force-yes clearwater-snmp-handler-astaire
#RUN echo "log_level=5" >> /etc/clearwater/user_settings

COPY sprout.supervisord.conf /etc/supervisor/conf.d/sprout.conf
COPY clearwater-group.supervisord.conf /etc/supervisor/conf.d/clearwater-group.conf
COPY clearwater-auto-config-docker /etc/init.d/clearwater-auto-config-docker

# We need to start the socket factories so that we can write to SAS.
RUN cp /etc/clearwater/socket-factory.supervisord.conf /etc/supervisor/conf.d/
RUN chmod +x /etc/init.d/clearwater-auto-config-docker
RUN /etc/init.d/sprout restart

#RUN sed 's/--realm=$home_domain/--realm=default.svc.cluster.local/' -i /etc/init.d/sprout
#RUN sed 's/--domain=$home_domain/--domain=default.svc.cluster.local/' -i /etc/init.d/sprout

EXPOSE 5052 5054
