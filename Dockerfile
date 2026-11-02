FROM eclipse-temurin:17-jdk

WORKDIR /app

COPY . .

RUN javac helloworld.java

CMD ["java", "helloworld.java"]
