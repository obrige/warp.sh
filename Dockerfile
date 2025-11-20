# 使用轻量级 Alpine
FROM alpine:latest

# 安装 warp.sh 运行所需的依赖
RUN apk add --no-cache curl jq wireguard-tools bash

# 设置工作目录
WORKDIR /app

# 将当前仓库的所有文件复制到镜像中
COPY . .

# 赋予脚本执行权限
RUN chmod +x warp.sh

# 默认启动 bash，方便你“进去玩”
CMD ["bash"]
