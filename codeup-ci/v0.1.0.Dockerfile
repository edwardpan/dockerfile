FROM registry.cn-beijing.aliyuncs.com/rdc-builds/base:1.0

RUN mkdir /root/.cargo
COPY config /root/.cargo/config

ENV RUSTUP_DIST_SERVER=https://mirrors.tuna.tsinghua.edu.cn/rustup

RUN cd /tmp && \    
    curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh -s -- -y && \
    source $HOME/.cargo/env && rustc -V && cargo -V && \
    rustup target add x86_64-pc-windows-gnu && \
    rustup toolchain install stable-x86_64-pc-windows-gnu && \
    sudo apt update && sudo apt install -y mingw-w64

ENV PATH=${PATH}:/root/.cargo/bin
