FROM alpine:latest
ADD . /usr/local/fq
RUN apk add --no-cache curl openssl && \
    curl -L -o "/usr/local/fq/v2ray-linux-64.zip" "https://github.com/v2ray/v2ray-core/releases/latest/download/v2ray-linux-64.zip" && \
    unzip /usr/local/fq/v2ray-linux-64.zip -d /usr/local/fq && \
    chmod -R 777 /usr/local/fq
ENV SS_METHOD=aes-128-cfb SS_PASSWORD=123123 VMESS_UUID=e65663e8-4211-4a91-8e69-5dcddb6dabb2 VMESS_ALTERID=0 VMESS_WS_HOST=www.mydomain.com VMESS_WS_PATH=\/
WORKDIR /usr/local/fq
CMD ["./run.sh"]
