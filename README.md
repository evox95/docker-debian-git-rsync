# docker-debian-git-rsync
==============

A minimal Debian Slim Linux docker image with `git` and `rsync`.

Automatically build upon pushes to the master branch:
https://hub.docker.com/r/evox95/docker-debian-git-rsync

Usage
-----

Example `.gitlab-ci.yml` configuration:

```yml
deploy_production:
  image: evox95/docker-debian-git-rsync
  stage: deploy
  only:
    - master
  script:
    - echo "${SSH_KEY_PRIVATE}" > "${HOME}/.ssh/id_rsa"
    - rsync -azv --exclude=".git" -e "ssh -i ${HOME}/.ssh/id_rsa" ./ username@host:~/
```
