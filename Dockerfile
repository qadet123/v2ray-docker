FROM alpine:latest
ADD . /usr/local/fq
RUN apk add --no-cache supervisor && chmod -R 777 /usr/local/fq
ENV SS_METHOD=aes-128-cfb SS_PASSWORD=123123 SS_KCP_KEY=123123 SS_KCP_CRYPT=aes-128 SS_KCP_MODE=fast2 VMESS_ID=e65663e8-4211-4a91-8e69-5dcddb6dabb2 VMESS_ALTER_ID=0 VMESS_MKCP_ID=e65663e8-4211-4a91-8e69-5dcddb6dabb2 VMESS_MKCP_ALTER_ID=0
CMD ["sh","/usr/local/fq/run.sh"]
