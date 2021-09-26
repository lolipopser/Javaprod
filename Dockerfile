
FROM ubuntu:20.04
RUN apt-get update
RUN apt-get install tomcat9 -y
RUN apt-get install default-jdk -y
RUN apt-get install maven -y
RUN apt-get install git -y
RUN mkdir /var/boxfuse_src
WORKDIR /var/boxfuse_src
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
WORKDIR /var/boxfuse_src/boxfuse-sample-java-war-hello
RUN mvn package
WORKDIR /var/lib/
RUN pwd
RUN ls -la
RUN cp /var/boxfuse_src/boxfuse-sample-java-war-hello/target/hello-1.0.war /var/lib/tomcat9/webapps
EXPOSE 80
CMD ["catalina.sh", "run"]
