FROM land007/ubuntu-node:latest

MAINTAINER Yiqiu Jia <yiqiujia@hotmail.com>

RUN rm /node_/node_modules
ADD node/ /node_/

ENV SSHIP=192.168.1.1\
	SSHPORT=22\
	USERNAME=land007\
	PASSWORD=1234567\
	PROXYIP=172.17.0.1\
	PROXYPORT=8000

#> docker buildx build --platform linux/amd64,linux/arm64,linux/arm/v7 -t land007/ssh-proxy --push .
#docker build -t land007/ssh-proxy:latest .
#docker run -it --rm --name ssh-proxy --privileged -v ~/docker/ssh-proxy:/node -p 443:443 -e "DOMAIN_NAME=ssh-proxy.qhkly.com" -e "SERVICE_REGION=westus" -e "SUBSCRIPTION_KEY=6e83631f53fb4a07b0cde7cf8fab0b26" land007/ssh-proxy:latest
#docker run -it --restart always --name ssh-proxy --privileged -v ~/docker/ssh-proxy:/node -p 443:443 -e "DOMAIN_NAME=ssh-proxy.qhkly.com" -e "SERVICE_REGION=westus" -e "SUBSCRIPTION_KEY=6e83631f53fb4a07b0cde7cf8fab0b26" land007/ssh-proxy:latest
#docker kill watchtower ; docker rm watchtower ; docker run -d --name watchtower -v /var/run/docker.sock:/var/run/docker.sock -v ~/.docker/config.json:/config.json v2tec/watchtower --interval 30 --label-enable
#docker pull land007/ssh-proxy:latest; rm -rf ~/docker/ssh-proxy; docker rm -f ssh-proxy ; docker run -it --restart always --privileged -e "DOMAIN_NAME=ssh-proxy.qhkly.com" --label=com.centurylinklabs.watchtower.enable=true -v ~/docker/ssh-proxy:/node -p 1443:443 -e "SERVICE_REGION=westus" -e "SUBSCRIPTION_KEY=6e83631f53fb4a07b0cde7cf8fab0b26" --name ssh-proxy --log-opt max-size=1m --log-opt max-file=1 land007/ssh-proxy:latest
#docker rm -f ssh-proxy ; docker run -it --restart always --privileged -e "DOMAIN_NAME=ssh-proxy.qhkly.com" --label=com.centurylinklabs.watchtower.enable=true -v ~/docker/ssh-proxy:/node -p 20443:443 -e "SERVICE_REGION=japaneast" -e "SUBSCRIPTION_KEY=8f89f691cf434315a4fdb22b1b371ba2" --name ssh-proxy --log-opt max-size=1m --log-opt max-file=1 land007/ssh-proxy:latest
