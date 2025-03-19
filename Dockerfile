FROM    openjdk:17-ea-slim-buster
EXPOSE  8080
ADD     ./build/libs/jenkins_test-0.0.1-SNAPSHOT.jar   /app.jar
CMD     java -jar /app.jar