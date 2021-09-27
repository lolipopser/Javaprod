FROM ubuntu:20.04
RUN apt update && apt upgrade -y
RUN apt install default-jdk -y
RUN apt install maven -y
RUN apt install git -y
WORKDIR /var/boxfuse_src
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
WORKDIR /var/boxfuse_src/boxfuse-sample-java-war-hello
RUN mvn package
RUN wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.53/bin/apache-tomcat-9.0.53.tar.gz -O /tmp/tomcat.tar.gz
RUN cd /tmp && tar xvfz tomcat.tar.gz
RUN cp -Rv /tmp/apache-tomcat-9.0.53/* /usr/local/tomcat/
RUN cp /var/boxfuse_src/boxfuse-sample-java-war-hello/target/hello-1.0.war /usr/local/tomcat/webapps
EXPOSE 8080
CMD ["/usr/local/tomcat/bin/catalina.sh", "run"]
