FROM siutin/ubuntu-rvm:latest
MAINTAINER Martin Chan <osiutino@gmail.com>
ENV REFRESHED_AT 2015-04-11

USER root

#RUN apt-get install sudo -y
RUN apt-get update && apt-get clean
RUN apt-get install -q -y openjdk-7-jre-headless && apt-get clean
RUN apt-get install git-core -y
RUN apt-get install nodejs -y
RUN apt-get install libmysqlclient-dev -y
RUN apt-get install libyaml-dev -y

USER worker

ENV JENKINS_WAR /home/worker/jenkins.war
ENV JENKINS_HOME /home/worker/jenkins

RUN curl -L http://mirrors.jenkins-ci.org/war/1.608/jenkins.war > "$JENKINS_WAR"
RUN chmod 644 "$JENKINS_WAR"
RUN mkdir -p "$JENKINS_HOME"

ENTRYPOINT ["java", "-jar", "$JENKINS_WAR"]
EXPOSE 8080
CMD [""]
