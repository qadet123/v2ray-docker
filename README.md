# Usage:

映射端口：

```
10001: ss
10002: vmess
10003/udp: vmess with mkcp
10004: vmess with websocket & tls
```

配置变量默认值

```
SS_METHOD=aes-128-cfb
SS_PASSWORD=123123
VMESS_UUID=e65663e8-4211-4a91-8e69-5dcddb6dabb2
VMESS_ALTERID=0
VMESS_WS_HOST=www.mydomain.com
VMESS_WS_PATH=/
```

需要修改配置直接传入对应的变量即可
```bash
docker run --restart=always -d \
-e SS_METHOD=chacha20
-e VMESS_MKCP_ALTER_ID=10
-e VMESS_WS_PATH=/_watch
-p <port>:10001
-p <port>:10002
-p <port>:10003/udp
-p <port>:10004
bbbx123/fq:1.3
```

# Useful links
[kcptun docs](https://github.com/xtaci/kcptun/blob/master/README.md#usage) 

[v2ray-vmess-docs](https://www.v2ray.com/chapter_02/protocols/vmess.html)

[v2ray-shadowsocks-docs](https://www.v2ray.com/chapter_02/protocols/shadowsocks.html)

[v2ray-mkcp-docs](https://www.v2ray.com/chapter_02/transport/mkcp.html)
