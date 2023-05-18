FROM debian:bookworm-20230502-slim

RUN apt-get update && \ 
  apt-get -y install git ssh rsync curl php unzip zip wget && \
  apt-get clean && \
  mkdir ~/.ssh && \
  echo "StrictHostKeyChecking no" >> ~/.ssh/config && \
  chmod -R 600 ~/.ssh && \
  # install composer
  cd ~ && \
  php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
  php composer-setup.php && \
  php -r "unlink('composer-setup.php');" && \
  # install npm
  curl -sL https://deb.nodesource.com/setup_12.x | bash - && \
  apt-get install -y build-essential nodejs && \
  apt-get clean
