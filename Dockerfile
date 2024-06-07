FROM ubuntu:20.04

WORKDIR /frp

RUN apt-get update && apt-get install -y wget curl nano && apt-get clean

# frpc_linux_amd64 相关
COPY frpc.env.yml /app/frpc.env.yml
COPY frpc_linux_amd64 /app/frpc

ENV FRPC_WEB_SERVER_ADDR=0.0.0.0
ENV FRPC_WEB_SERVER_PORT=6556
ENV FRPC_WEB_SERVER_USER=admin
ENV FRPC_WEB_SERVER_PASSWORD=admin
ENV FRPC_SERVER_ADDR=""
ENV FRPC_SERVER_PORT=7000
ENV FRPC_AUTH_METHOD=token
ENV FRPC_AUTH_TOKEN=""

RUN chmod -R 777 /app

EXPOSE 6556

# 启动 supervisor
CMD ["/app/frpc", "-c", "/app/frpc.env.yml"]
