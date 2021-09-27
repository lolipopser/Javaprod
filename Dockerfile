FROM tomcat:latest
RUN apt-get update
RUN apt-get install default-jdk -y
RUN apt-get install maven -y
RUN apt-get install git -y
WORKDIR /var/boxfuse_src
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
WORKDIR /var/boxfuse_src/boxfuse-sample-java-war-hello
RUN mvn package
RUN cp /var/boxfuse_src/boxfuse-sample-java-war-hello/target/hello-1.0.war /usr/local/tomcat/webapps/

