FROM ubuntu:20.04
RUN apt-get update
RUN apt-get install tomcat9 -y
RUN apt-get install default-jdk -y
RUN apt-get install maven -y
RUN apt-get install git -y
WORKDIR /var/boxfuse_src
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
WORKDIR /var/boxfuse_src/boxfuse-sample-java-war-hello
RUN mvn package
RUN cp /var/boxfuse_src/boxfuse-sample-java-war-hello/target/hello-1.0.war /var/lib/tomcat9/webapps
EXPOSE 8080
CMD ["/usr/share/tomcat9/bin/catalina.sh", "run"]
