similar with and thanks to: https://github.com/hangim/kcp-shadowsocks-docker

v2ray ver: 4.20.0  
kcptun ver: 20190924

# Usage:
```bash
docker run --restart=always -d \
-e SS_METHOD=<aes-256-cfb|aes-128-cfb|chacha20|chacha20-ietf|aes-256-gcm|aes-128-gcm|chacha20-poly1305|chacha20-ietf-poly1305>  \ # default "aes-128-cfb"
-e SS_PASSWORD=<string> \ # default "123123"
-e SS_KCP_KEY=<string>\ # default "123123"
-e SS_KCP_CRYPT=<aes|aes-128|aes-192|salsa20|blowfish|twofish|cast5|3des|tea|xtea|xor|sm4|none> \ #default "aes-128" 
-e SS_KCP_MODE=<fast3|fast2|fast|normal> \ # default "fast2"
-e VMESS_ID=<uuid> \ # default "e65663e8-4211-4a91-8e69-5dcddb6dabb2" 
-e VMESS_ALTER_ID=<0-65535> \ default 0
-e VMESS_MKCP_ID=<uuid> \ default "e65663e8-4211-4a91-8e69-5dcddb6dabb2"
-e VMESS_MKCP_ALTER_ID=<0-65535>  \ default 0
-p <port>:10001 \ # shadowsocks
-p <port>:10002/udp \ # kcptun encapsulated shadowsocks
-p <port>:10003 \ # vmess
-p <port>:10004/udp \ # mkcp encapsulated  vmess
bbbx123/fq:1.1
```

you can find each arg's meaning in [kcptun docs](https://github.com/xtaci/kcptun/blob/master/README.md#usage) and [v2ray-vmess-docs](https://www.v2ray.com/chapter_02/protocols/vmess.html),[v2ray-shadowsocks-docs](https://www.v2ray.com/chapter_02/protocols/shadowsocks.html),[v2ray-mkcp-docs](https://www.v2ray.com/chapter_02/transport/mkcp.html)
