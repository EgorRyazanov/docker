FROM ubuntu:20.04
USER root
WORKDIR /home/app
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get -qq install curl gnupg
RUN curl  -sL https://deb.nodesource.com/setup_16.x | bash
RUN apt-get -qq install nodejs
RUN npm install yarn -g
COPY . .
EXPOSE 3000
RUN yarn install
CMD ["node", "index.js"]