    FROM ubuntu
    RUN apt update
    RUN apt install --yes git
    RUN apt install --yes openssh-client
    RUN apt-get update
    RUN apt install --yes curl
    RUN apt install --yes g++
    RUN apt install --yes python2-minimal
    RUN mkdir ~/.ssh/
    RUN chmod 0600 ~/.ssh

    RUN ssh-keyscan github.com >> ~/.ssh/known_hosts
    RUN touch ~/.ssh/known_hosts
    RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
    RUN apt install --yes nodejs
    RUN npm install --global yarn@1.22.18
    RUN npm install --global json
    RUN curl https://install.meteor.com/ | sh

    WORKDIR Rocket.Chat
    RUN json -I -f package.json -e "this.volta.node=\"14.21.3\""
    RUN json -I -f package.json -e "this.engines.node=\"14.21.3\""
    RUN yarn
