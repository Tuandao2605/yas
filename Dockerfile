# Giai đoạn 1: Lấy Java 25 từ image OpenJDK chính thức
FROM openjdk:25-ea-jdk-slim AS java-base

# Giai đoạn 2: Build Jenkins image
FROM jenkins/jenkins:lts

USER root

# Copy Java 25 từ giai đoạn 1 sang thư mục /opt/jdk-25
COPY --from=java-base /usr/local/openjdk-25 /opt/jdk-25

# Cấu hình biến môi trường
ENV JAVA_HOME=/opt/jdk-25
ENV PATH="$JAVA_HOME/bin:$PATH"

# Kiểm tra thử xem java hoạt động không trong lúc build
RUN java -version

USER jenkins