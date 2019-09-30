similar with and thanks to: https://github.com/hangim/kcp-shadowsocks-docker

v2ray ver: 4.20.0  
kcptun ver: 20190924

this repo did not include the binaries

# Ports:
10001: shadowsocks  
10002(udp): shadowsocks with kcptun  
10003: vmess  
10004(udp): vmess with mkcp 

# Default ENVs:
SS_METHOD: "aes-128-cfb"  
SS_PASSWORD: "123123"  
SS_KCP_KEY: "123123"  
SS_KCP_CRYPT: "aes-128"  
SS_KCP_MODE: "fast2"  
VMESS_ID:  "e65663e8-4211-4a91-8e69-5dcddb6dabb2"  
VMESS_ALTER_ID: 0  
VMESS_MKCP_ID: "e65663e8-4211-4a91-8e69-5dcddb6dabb2"  
VMESS_MKCP_ALTER_ID: 0

# Custom ENVs:
```bash
docker run --restart=always -d \
-e SS_METHOD=aes-128-cfb \
-e SS_PASSWORD=123123 \
-e SS_KCP_KEY=123123 \
-e SS_KCP_CRYPT=aes-128 \
-e SS_KCP_MODE=fast2 \
-e VMESS_ID=e65663e8-4211-4a91-8e69-5dcddb6dabb2 \
-e VMESS_ALTER_ID=0 \
-e VMESS_MKCP_ID=e65663e8-4211-4a91-8e69-5dcddb6dabb2 \
-e VMESS_MKCP_ALTER_ID=0  \
-p 10001-10004:10001-10004 \
-p 10001-10004:10001-10004/udp \
bbbx123/fq:1.1
```

you can find each arg's meaning in [kcptun docs](https://github.com/xtaci/kcptun/blob/master/README.md#usage) and [v2ray-vmess-docs](https://www.v2ray.com/chapter_02/protocols/vmess.html),[v2ray-shadowsocks-docs](https://www.v2ray.com/chapter_02/protocols/shadowsocks.html),[v2ray-mkcp-docs](https://www.v2ray.com/chapter_02/transport/mkcp.html)
