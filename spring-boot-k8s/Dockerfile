# Build
FROM maven:3.8.5-openjdk-17 as build

WORKDIR /workspace
COPY . ./

RUN mvn package -DskipTests
RUN mkdir -p target/dependency && (cd target/dependency; jar -xf ../*.jar)

# Prd
FROM openjdk:17

VOLUME /opt/tomcat

ARG DEPENDENCY=/workspace/target/dependency

COPY --from=build ${DEPENDENCY}/BOOT-INF/lib /app/lib
COPY --from=build ${DEPENDENCY}/META-INF /app/META-INF
COPY --from=build ${DEPENDENCY}/BOOT-INF/classes /app

ENTRYPOINT ["java", "-cp", "app:app/lib/*", "asia.chipmunk.spb.k8s.Application"]
