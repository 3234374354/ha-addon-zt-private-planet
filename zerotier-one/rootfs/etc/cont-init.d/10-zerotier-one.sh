#!/usr/bin/with-contenv bash
# ==============================================================================
# TomCzhen's Hass.io Add-ons: ZeroTier One
# Take down the S6 supervision tree when ZeroTier One fails
# ==============================================================================
source /usr/lib/hassio-addons/base.sh

# 读取配置
api_auth_token=$(hass.config.get 'api_auth_token')
echo ${api_auth_token} > /data/authtoken.secret

# 支持多个网络
networks=$(hass.config.get 'networks')

# 初始化数据目录
if ! hass.directory_exists "/data/networks.d"; then
    mkdir -p /data/networks.d
fi

# 挂载/复制 planet 文件，优先使用宿主机挂载
if [ -f /share/zerotier-planet/planet ]; then
    cp /share/zerotier-planet/planet /data/planet
    echo "使用宿主机自定义 planet 文件"
else
    echo "未检测到自定义 planet，使用默认配置"
fi

# 软链数据目录
ln -sf /data /var/lib/zerotier-one

# 自动加入指定网络
IFS=',' read -ra NET_ARR <<< "$networks"
for netid in "${NET_ARR[@]}"; do
    if [ -n "$netid" ]; then
        touch /data/networks.d/${netid}.conf
    fi
    # 可扩展：自动 zerotier-cli join $netid
    # 但需确保 zerotier-one 已启动
done