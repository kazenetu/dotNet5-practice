FROM ubuntu:18.04

RUN apt-get update
RUN apt-get install -y curl libunwind8 gettext apt-transport-https wget gpg software-properties-common git

# intall Node.js
RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash
RUN apt-get install -y nodejs
RUN npm install -g npm@7.11.1

# install dotnet-sdk
RUN wget -q https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
RUN dpkg -i packages-microsoft-prod.deb

RUN apt-get update
RUN add-apt-repository universe
RUN apt-get update
RUN apt-get install -y dotnet-sdk-5.0

WORKDIR /source
