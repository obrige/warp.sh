# 使用官方 Arch Linux 镜像
FROM archlinux:latest

# 1.‌ 更新系统并安装依赖
# pacman 参数说明: -Syu 更新数据库并升级系统, --noconfirm 自动确认
RUN pacman -Syu --noconfirm && \
    pacman -S --noconfirm curl jq wireguard-tools git bash

# 2.‌ 设置工作目录
WORKDIR /app

# 3.‌ 直接在容器内克隆代码
# 这样做的好处：绝对是 Linux 格式，绝对没有 Windows 换行符报错
RUN git clone https://github.com/rany2/warp.sh.git .

# 4.‌ 赋予执行权限
RUN chmod +x warp.sh

# 5.‌ 设置默认入口为 bash，方便你进去玩
CMD ["bash"]
