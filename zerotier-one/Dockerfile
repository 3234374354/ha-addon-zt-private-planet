ARG BUILD_FROM=hassioaddons/ubuntu-base-amd64:2.3.1
FROM ${BUILD_FROM}

# Build arugments
ARG BUILD_DATE
ARG BUILD_REF
ARG BUILD_VERSION
ARG BUILD_ARCH=amd64
ARG ZT_VER=1.2.12

# Install ZeroTier One
RUN apt-get update -yqq \
  && apt-get install kmod iproute2 -y \
  && curl https://download.zerotier.com/RELEASES/${ZT_VER}/dist/debian/stretch/pool/main/z/zerotier-one/zerotier-one_${ZT_VER}_${BUILD_ARCH}.deb -o /tmp/zerotier-one.deb \
  && dpkg-deb -x /tmp/zerotier-one.deb /tmp/zerotier-one \
  && cp /tmp/zerotier-one/usr/sbin/zerotier-one /usr/bin \
  && ln -s /usr/bin/zerotier-one /usr/bin/zerotier-cli \
  && addgroup --system --gid 1000 zerotier-one \
  && adduser --system --ingroup zerotier-one --home /var/lib/zerotier-one --no-create-home --uid 1000 zerotier-one \
  && rm -rf /tmp/*

# Copy root filesystem
COPY rootfs /

# Labels
LABEL \
    io.hass.name="zerotier-one" \
    io.hass.description="ZeroTier One for Hass.io" \
    io.hass.arch="${BUILD_ARCH}" \
    io.hass.type="addon" \
    io.hass.version=${BUILD_VERSION} \
    maintainer="3234374354 <github.com/3234374354>" \
    org.label-schema.description="ZeroTier One for Hass.io" \
    org.label-schema.build-date=${BUILD_DATE} \
    org.label-schema.name="ZeroTier" \
    org.label-schema.schema-version="1.1.0" \
    org.label-schema.url="https://github.com/3234374354/ha-addon-zt-private-planet" \
    org.label-schema.usage="https://github.com/3234374354/ha-addon-zt-private-planet/blob/master/README.md" \
    org.label-schema.vcs-ref=${BUILD_REF} \
    org.label-schema.vcs-url="https://github.com/3234374354/ha-addon-zt-private-planet" \
    org.label-schema.vendor="3234374354 Hass.io Addons"

# 设置 run.sh 为容器启动入口
ENTRYPOINT ["/run.sh"]