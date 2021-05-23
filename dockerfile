FROM ubuntu:18.04

RUN apt-get update
RUN apt-get install -y curl libunwind8 gettext apt-transport-https wget gpg software-properties-common git

# intall Node.js
RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash
RUN apt-get install -y nodejs
RUN npm install -g npm@7.11.1

# install angular/cli:8.3.29
RUN npm install -g @angular/cli@8.3.29

# install dotnet-sdk
RUN wget -q https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
RUN dpkg -i packages-microsoft-prod.deb

RUN apt-get update
RUN add-apt-repository universe
RUN apt-get update
RUN apt-get install -y dotnet-sdk-5.0

WORKDIR /source

# create tools/CStoTS
RUN mkdir -p /tools/CStoTS \
    mkdir -p /tool_temp \
    && git clone --recursive https://github.com/kazenetu/CStoTS.git /tool_temp \
    && cd /tool_temp \
    && dotnet publish ConvertCStoTS -c Release -o /tools/CStoTS -f net5.0
RUN echo '#!/bin/sh \ncd /source\ndotnet /tools/CStoTS/ConvertCStoTS.dll Interfaces/ -o ClientApp/src/interfaces/' > /tools/CStoTS.sh \
    && chmod +x /tools/CStoTS.sh
ENV PATH $PATH:/tools

# create client and server files
COPY docker_resource/template.cs /tools/template.cs
COPY docker_resource/create.txt /tools/create.sh
RUN chmod +x /tools/create.sh
