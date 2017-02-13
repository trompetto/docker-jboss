FROM 		ubuntu:16.04
RUN     	apt-get update && apt-get -y -q install software-properties-common 
RUN		echo oracle-java6-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
		add-apt-repository ppa:webupd8team/java && \
		apt-get update	&& \
		apt-get -y -q install oracle-java6-installer 
RUN		apt-get install unzip
RUN 		wget https://sourceforge.net/projects/jboss/files/JBoss/JBoss-5.1.0.GA/jboss-5.1.0.GA-jdk6.zip/download
RUN		unzip download
RUN		mkdir -p /opt
RUN		mv jboss-5.1.0.GA /opt

EXPOSE		8080

ADD 		entrypoint.sh entrypoint.sh

RUN 		chmod +x entrypoint.sh

ENTRYPOINT	["/entrypoint.sh"]
