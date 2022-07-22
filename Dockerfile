FROM mcr.microsoft.com/dotnet/sdk:6.0
ENV DEBIAN_FRONTEND=noninteractive


RUN apt-get update && apt-get install -y apt-transport-https lsb-release gnupg curl \
  && rm -rf /var/lib/apt/lists/*

RUN curl -sL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > /etc/apt/trusted.gpg.d/microsoft.gpg
RUN sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/debian/$(lsb_release -rs | cut -d'.' -f 1)/prod $(lsb_release -cs) main" > /etc/apt/sources.list.d/dotnetdev.list'
RUN sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $(lsb_release -cs) main" >> /etc/apt/sources.list.d/dotnetdev.list'

RUN apt-get update && apt-get install -y azure-functions-core-tools-4 azure-cli \
  && rm -rf /var/lib/apt/lists/*