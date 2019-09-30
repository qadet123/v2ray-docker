#!/bin/sh
cd $(dirname $0)
sed -i "s/SS_METHOD/${SS_METHOD}/g" ./*.conf
sed -i "s/SS_PASSWORD/${SS_PASSWORD}/g" ./*.conf
sed -i "s/SS_KCP_KEY/${SS_KCP_KEY}/g" ./*.conf
sed -i "s/SS_KCP_CRYPT/${SS_KCP_CRYPT}/g" ./*.conf
sed -i "s/SS_KCP_MODE/${SS_KCP_MODE}/g" ./*.conf
sed -i "s/VMESS_ID/${VMESS_ID}/g" ./*.conf
sed -i "s/VMESS_ALTER_ID/${VMESS_ALTER_ID}/g" ./*.conf
sed -i "s/VMESS_MKCP_ID/${VMESS_MKCP_ID}/g" ./*.conf
sed -i "s/VMESS_MKCP_ALTER_ID/${VMESS_MKCP_ALTER_ID}/g" ./*.conf
exec supervisord -c /usr/local/fq/supervisor.conf
