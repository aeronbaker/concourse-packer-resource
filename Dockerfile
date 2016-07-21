FROM alpine:latest

ENV runDependencies curl jq bash unzip python py-pip
ENV packerURL https://releases.hashicorp.com/packer/0.10.1/packer_0.10.1_linux_amd64.zip

RUN apk --no-cache add ${runDependencies}; \
    curl -L -o packer.zip ${packerURL}; \
    unzip packer.zip; \
    rm packer.zip; \
    mv packer /usr/local/bin/packer; \
    chmod +x /usr/local/bin/packer; \
    pip install awscli

ADD bin/check /opt/resource/check
ADD bin/in /opt/resource/in
ADD bin/out /opt/resource/out

CMD /usr/local/bin/packer
