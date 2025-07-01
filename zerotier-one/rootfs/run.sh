#!/bin/bash
set -e

# 初始化数据目录
mkdir -p /data/networks.d

# 挂载/复制 planet 文件，优先使用宿主机
if [ -f /share/zerotier-planet/planet ]; then
    cp /share/zerotier-planet/planet /data/planet
    echo "使用宿主机自定义 planet 文件"
else
    echo "未检测到自定义 planet，使用默认配置"
fi

# 软链数据目录
ln -sf /data /var/lib/zerotier-one

# 启动 zerotier-one 服务
zerotier-one &
ZT_PID=$!
sleep 3

# 自动加入指定网络
if [ -f /data/networks.conf ]; then
    networks=$(cat /data/networks.conf)
    IFS=',' read -ra NET_ARR <<< "$networks"
    for netid in "${NET_ARR[@]}"; do
        if [ -n "$netid" ]; then
            zerotier-cli join $netid || true
        fi
    done
fi

wait $ZT_PID
