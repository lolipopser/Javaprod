
FROM tomcat:9.0
RUN apt-get update
RUN apt-get install default-jdk -y
RUN apt-get install maven -y
RUN apt-get install git -y
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git /var/buxfuse_src
WORKDIR /var/boxfuse_src
RUN ls -la
RUN mvn package
RUN cp /var/boxfuse_src/target/hello-1.0.war /var/lib/tomcat9/webapps
EXPOSE 80
CMD ["catalina.sh", "run"]
