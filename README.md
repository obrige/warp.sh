# warp.sh

使用本工具即表示您同意 Cloudflare 的服务条款：<https://www.cloudflare.com/application/terms/>  

## 快速指南 #1

使用此脚本前，请确保已安装 `jq`、`curl` 和 `wireguard-tools`（用于 `wg genkey` 和 `wg pubkey`）。  

```shell
git clone https://github.com/rany2/warp.sh.git
cd warp.sh
./warp.sh
```

生成的 WireGuard 配置将输出至标准输出。

## 快速指南 #2

若要在 GitHub Codespaces 上运行此脚本，无需设置本地环境，请按以下步骤操作：

1. 打开仓库页面，找到绿色按钮，点击“Code”，选择“Codespaces”，然后选择“Create codespace on master”。
2. 等待 Codespace 创建完成。就绪后，打开终端并运行命令 `./warp.sh`。
3. 使用完毕后，请务必删除 Codespace，以保持整洁并节省资源。

请注意，删除 Codespace 会清除其中的所有更改和配置，因此关闭前请确保已保存重要文件或设置。

## 使用选项

```
用法：./warp.sh [选项]
  -4  使用 IPv4 执行 curl
  -6  使用 IPv6 执行 curl
  -T  Teams JWT 令牌（默认不发送 JWT 令牌）
  -R  刷新令牌（格式为 token,device_id,wg_private_key；指定此项以获取更新后的配置）
  -t  显示 Cloudflare 测速信息后退出
  -h  显示此帮助页面后退出
```

### 关于 Teams 注册

  1. 访问 https://\<teams id>.cloudflareaccess.com/warp
  2. 像使用官方客户端一样完成身份验证
  3. 检查页面源代码以查找 JWT 令牌，或在“网页控制台”（Ctrl+Shift+K）中运行以下代码：

```js
console.log(document.querySelector("meta[http-equiv='refresh']").content.split("=")[2])
```

  4. 将输出结果作为 `-T` 参数的值传入。最终命令如下所示：

```shell
./warp.sh -T eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.....
```

### 关于 -T 与 -R 选项

`-T` 和 `-R` 均支持传入文件作为参数。文件内容格式需与命令行参数格式相同。此举可避免令牌暴露于 shell 历史记录或进程列表中。
