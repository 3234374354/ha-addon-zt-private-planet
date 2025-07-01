# ZeroTier One Custom Planet Add‑on

> A Home Assistant add‑on for ZeroTier One with **custom Planet** support.  
> 适用于 Home Assistant 的支持**自定义 Planet**的 ZeroTier One 加载项。

---

## 🎯 Features / 特性

- **Custom Planet**  
  - 自动加载用户提供的 Planet 二进制，实现私有根服务器托管  
  - 支持宿主机 `/share/zerotier-planet/planet` 热更新  
  - 优先使用挂载目录中的 Planet，不改镜像即可灵活切换  
- Multi‑arch 镜像  
  - 支持 `amd64` 和 `arm64`，适配大多数 Home Assistant 硬件  

---

## 📦 Installation / 安装

1. 在 Home Assistant 中打开 **Supervisor → Add‑on 商店 → 右上角 ⋮ → 存储库**  
2. 添加仓库地址：[https://github.com/3234374354/ha-addon-zt-private-planet](https://github.com/3234374354/ha-addon-zt-private-planet)
3. 刷新后点击 **“Zerotier One Custom Planet”** → **安装**  
4. 在 **Configuration** 中填写：  
- `networks`: 要加入的 ZeroTier 网络 ID 列表  
5. 启动 Add‑on 并检查日志：  
```
[INFO] Using host-shared planet: /share/zerotier-planet/planet
````

---

## ⚙️ Configuration / 配置

```jsonc
{
"networks": ["<your_network_id1>", "<your_network_id2>"],
"api_auth_token": "<your_authtoken.secret内容>"
}
````

* **networks**: ZeroTier 网络 ID 数组
* **api\_auth\_token**: 用于访问本地 JSON API 的令牌

更多配置项可参考 [官方文档](https://www.zerotier.com/manual.shtml#4.1)。

---

## 🌐 Custom Planet 支持说明

1. **宿主机放置**

   * 在宿主机目录 `/usr/share/hassio/homeassistant/share/zerotier-planet/` 下放入你的 `planet` 二进制文件
2. **容器挂载**

   * Add‑on 自动将宿主机的 `/share/zerotier-planet/planet` 映射到容器内
3. **启动逻辑**

   * 脚本检测到该文件后，会覆盖到 `/data/zerotier-one/planet`，优先使用自定义根服务器
4. **热更新**

   * 更新宿主机的 `planet` 文件后，重启 Add‑on 即可生效，无需重建镜像

---

## 📚 Quick Tutorial / 快速教程

1. **Fork & Clone**

   * Fork 仓库 → Codespaces 在线编辑 → 添加 `planet/planet` 文件
2. **Devcontainer 验证**

   * 在 Codespaces 终端运行：

     ```bash
     docker build --build-arg BUILD_ARCH=amd64 -t zt-custom:dev .
     docker run --rm -it zt-custom:dev bash
     zerotier-one -v
     ```
3. **CI/CD 构建**

   * Push `.github/workflows/build.yml` → 打 Tag → 多架构镜像自动推送到 GHCR
4. **HA 安装**

   * 添加自定义仓库 URL → 安装 → 填写配置 → 启动

---

## 🙏 Thanks / 感谢

> Based on **TomCzHen’s “Hass.io Add‑ons: ZeroTier One”** — thank you for the original work!

> 感谢 **TomCzHen** 的原始项目 “Hass.io Add‑ons: ZeroTier One”——致敬并感谢！

---

