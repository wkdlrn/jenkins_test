#FROM    openjdk:17-ea-slim-buster
#EXPOSE  8080
#ADD     ./build/libs/demo2-0.0.1-SNAPSHOT.jar   /app.jar
#CMD     java -jar /app.jar
#
#ENTRYPOINT ["java", "-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=*:5005","-jar","/app.jar"]
#
FROM    openjdk:17-ea-slim-buster
ADD     ./build/libs/jenkins_test-0.0.1-SNAPSHOT.jar /app.jar
CMD     java -jar /app.jar
# 8080 포트 열기 (스프링 부트 기본 포트)
EXPOSE 8080

ARG DEBUG=false
ENV DEBUG=${DEBUG}

# 컨테이너에서 애플리케이션 실행
#ENTRYPOINT ["java", "-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=*:5005","-jar","/app.jar"]
ENTRYPOINT ["sh", "-c", "if [ \"$DEBUG\" = \"true\" ]; then java -agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=*:5005 -jar /app.jar; else java -jar /app.jar; fi"]

