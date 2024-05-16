# Utilisez une image de base PHP avec Jenkins
FROM --platform=linux/amd64 jenkins/jenkins:latest

USER root

# Installez PHP et les extensions nécessaires
RUN apt-get update && \
    apt-get install -y php php-cli php-mbstring wget curl && \
    apt-get clean

# Installez Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Installez Symfony CLI
RUN wget https://get.symfony.com/cli/installer -O - | bash


# Installez Docker
RUN curl -fsSL https://get.docker.com -o get-docker.sh
RUN sh get-docker.sh

# Installez SonarScanner
RUN wget https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-4.6.2.2472-linux.zip
RUN unzip sonar-scanner-cli-4.6.2.2472-linux.zip
RUN mv sonar-scanner-4.6.2.2472-linux /usr/local/bin/sonar-scanner
RUN rm sonar-scanner-cli-4.6.2.2472-linux.zip

USER jenkins

