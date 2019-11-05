FROM debian:stretch-slim

RUN apt-get update && \
  apt-get -y install git ssh rsync && \
  apt-get clean && \
  mkdir ~/.ssh && \
  echo "StrictHostKeyChecking no" >> ~/.ssh/config && \
  chmod -R 600 ~/.ssh
