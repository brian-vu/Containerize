## Containerie Spring boot app

Create a docker file :   

```sh 
FROM openjdk:8-jdk-alpine
VOLUME /tmp
ARG JAR_FILE
COPY ${JAR_FILE} app.jar
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]
```

Add plugins to pom file 

```xml
<properties>
   <docker.image.prefix>springio</docker.image.prefix>
</properties>
<build>
    <plugins>
        <plugin>
            <groupId>com.spotify</groupId>
            <artifactId>dockerfile-maven-plugin</artifactId>
            <version>1.3.6</version>
            <configuration>
                <repository>${docker.image.prefix}/${project.artifactId}</repository>
                <buildArgs>
                    <JAR_FILE>target/${project.build.finalName}.jar</JAR_FILE>
                </buildArgs>
            </configuration>
        </plugin>
    </plugins>
</build>
```

You can build a tagged docker image using the command line like this:

```sh
./mvnw install dockerfile:build
```


> you can make dockerfile:push automatically run in the install or deploy 
> lifecycle phases by adding it to the plugin configuration.

```xml
<executions>
    <execution>
        <id>default</id>
        <phase>install</phase>
        <goals>
            <goal>build</goal>
            <goal>push</goal>
        </goals>
    </execution>
</executions>
```

