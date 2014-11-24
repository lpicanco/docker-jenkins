FROM 	dockerfile/java:oracle-java6
MAINTAINER Luiz Picanço "lpicanco@gmail.com"

ENV DEBIAN_FRONTEND noninteractive

RUN wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -
RUN echo "deb http://pkg.jenkins-ci.org/debian binary/" >> /etc/apt/sources.list

RUN apt-get update 
RUN apt-get install -y jenkins

# for main web interface:
EXPOSE 8080

# will be used by attached slave agents:
EXPOSE 50000

VOLUME ["/var/lib/jenkins"]

ADD run.sh /usr/local/bin/run.sh
RUN chmod +x /usr/local/bin/run.sh

CMD ["/usr/local/bin/run.sh"]