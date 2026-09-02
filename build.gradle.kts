plugins {
    java
    war
}

group = "br.edu.ifpr.irati.ads"
version = "1.0-SNAPSHOT"

java {
    toolchain {
        languageVersion.set(JavaLanguageVersion.of(17))
    }
}

repositories {
    mavenCentral()
}

dependencies {
    // Servlet API (Provided scope in Maven)
    compileOnly("jakarta.servlet:jakarta.servlet-api:6.1.0")

    // Application dependencies
    implementation("com.google.code.gson:gson:2.13.1")
    implementation("jakarta.xml.bind:jakarta.xml.bind-api:4.0.2")
    implementation("com.sun.xml.bind:jaxb-impl:4.0.4")
    implementation("org.hibernate.orm:hibernate-core:7.0.0.Final")
    implementation("org.mariadb.jdbc:mariadb-java-client:3.5.10")
}

tasks.withType<JavaCompile>().configureEach {
    options.encoding = "UTF-8"
}
