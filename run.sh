#!/bin/sh
SS_METHOD=aes-128-cfb 
SS_PASSWORD=123123 
VMESS_UUID=e65663e8-4211-4a91-8e69-5dcddb6dabb2 
VMESS_ALTERID=0 
VMESS_WS_HOST=www.mydomain.com 
VMESS_WS_PATH=\


openssl req -x509 -nodes -days 9999 -newkey rsa:2048 -keyout tls.key -out tls.crt -subj "/CN=${VMESS_WS_HOST}"


cat > v2ray.conf << EOF
{
	"inbounds": [{
			"port": 10001,
			"protocol": "shadowsocks",
			"settings": {
				"method": "${SS_METHOD}",
				"password": "${SS_PASSWORD}"
			}
		},
		{
			"port": 10002,
			"protocol": "vmess",
			"settings": {
				"clients": [{
					"id": "${VMESS_UUID}",
					"alterId": ${VMESS_ALTERID}
				}]
			}
		},
		{
			"port": 10003,
			"protocol": "vmess",
			"settings": {
				"clients": [{
					"id": "${VMESS_UUID}",
					"alterId": ${VMESS_ALTERID}
				}]
			},
			"streamSettings": {
				"network": "mkcp",
				"kcpSettings": {
					"uplinkCapacity": 5,
					"downlinkCapacity": 100,
					"congestion": true
				}
			}
		},
		{
			"port": 10004,
			"protocol": "vmess",
			"settings": {
				"clients": [{
					"id": "${VMESS_UUID}",
					"alterId": ${VMESS_ALTERID}
				}]
			},
			"streamSettings": {
				"network": "ws",
				"wsSettings": {
					"path": "${VMESS_WS_PATH}",
					"headers": {
						"Host": "${VMESS_WS_HOST}"
					}
				},
				"security": "tls",
				"tlsSettings": {
					"certificates": [{
						"certificateFile": "/usr/local/fq/tls.crt",
						"keyFile": "/usr/local/fq/tls.key"
					}]
				}
			}
		}
	],
	"outbounds": [{
		"protocol": "freedom",
		"settings": {

		}
	}]
}
EOF

sleep 3

exec /usr/local/fq/v2ray -config /usr/local/fq/v2ray.conf
