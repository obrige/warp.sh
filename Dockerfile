FROM archlinux:latest

RUN pacman -Syu --noconfirm && \
    pacman -S --noconfirm curl jq wireguard-tools bash dos2unix

WORKDIR /app

COPY . .

RUN dos2unix warp.sh && chmod +x warp.sh

CMD ["bash"]
