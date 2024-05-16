#Faire buil de l'image de jenkins-avec-symfony créée et préparée pour un projet symfony
FROM jenkins/inbound-agent:latest

# Switch to root user to install packages
USER root

# Mise à jour des paquets et installation des dépendances nécessaires
RUN apt-get update && \
    apt-get install -y \
        apt-transport-https \
        ca-certificates \
        curl \
        gnupg2 \
        software-properties-common \
        unzip \
        && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install PHP and dependencies
RUN apt-get update && \
    apt-get install -y wget unzip php php-cli php-xml php-mbstring php-zip

# Install Composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
    php composer-setup.php --install-dir=/usr/local/bin --filename=composer && \
    php -r "unlink('composer-setup.php');"

# Install Symfony CLI
RUN wget https://get.symfony.com/cli/installer -O - | bash && \
    mv /root/.symfony5/bin/symfony /usr/local/bin/symfony

# Install SonarScanner
RUN wget https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-4.6.2.2472-linux.zip && \
    unzip sonar-scanner-cli-4.6.2.2472-linux.zip -d /opt && \
    mv /opt/sonar-scanner-4.6.2.2472-linux /opt/sonar-scanner && \
    ln -s /opt/sonar-scanner/bin/sonar-scanner /usr/local/bin/sonar-scanner && \
    rm sonar-scanner-cli-4.6.2.2472-linux.zip

# Switch back to Jenkins user
USER jenkins
