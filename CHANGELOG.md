# TomCzHen's Hass.io Add-ons: ZeroTier One

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).

## [v2.0.0] - 2025-07-01

### Added / 新增
- Support custom Planet file, prioritize mounting `/share/zerotier-planet/planet`, hot update (take effect after container restart)
- Fully cloud-based development workflow (GitHub Codespaces online editing, no local Docker required)
- Home Assistant Add-on compatibility, UI config for networks and api_auth_token
- Container startup automation (`run.sh` script auto-initializes, mounts, starts, and auto-joins networks)
- GitHub Actions automated multi-arch (amd64/arm64) build and push to GHCR
- Tag push triggers CI, auto-pushes both latest and version tags
- Optimized README with detailed cloud dev, CI/CD, and HA Add-on usage

- 支持自定义 Planet 文件，优先挂载 `/share/zerotier-planet/planet`，热更新（重启容器即生效）
- 完全云端开发流程（GitHub Codespaces 在线编辑，无需本地 Docker）
- Home Assistant Add-on 兼容，UI 配置 networks、api_auth_token
- 容器启动自动化（run.sh 脚本自动初始化、挂载、启动、自动 join 网络）
- GitHub Actions 自动化多架构（amd64/arm64）构建并推送 GHCR
- Tag 推送即触发 CI，自动推送 latest 和版本 tag
- 优化 README，详细说明云端开发、CI/CD、HA Add-on 用法

## [v1.0.0] - 2018-04-06

### Added

- Initial release

[v1.0.0]: https://github.com/TomCzHen/hassio-addon-zerotier-one/tree/v1.0.0

## [v1.1.0] - 2019-03-07

### Changed

- Change Dockerfile use a new url for zerotier histroy version
- Switch `hassioaddons/ubuntu-base` base image
- Update zerotier on version to 1.2.12
- Update Readme