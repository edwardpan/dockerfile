FROM ubuntu:18.04

ENV TZ=Asia/Shanghai

WORKDIR /root

RUN sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list && \
    apt update && apt upgrade -y && \
    apt install -y software-properties-common && add-apt-repository ppa:deadsnakes/ppa && \
    ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone && \
    apt-get install -y tzdata locales wget unzip git curl python3 python3-pip

CMD ["sleep 1d"]