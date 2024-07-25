# sonolus-installer

## About

Install Sonolus on your iPad using Linux and Docker.

## How to run sonolus-installer

```bash
git clone https://github.com/n4mlz/sonolus-installer.git
cd sonolus-installer

docker compose up -d
```

## dependencies

#### ArchLinux

```bash
sudo pacman -S usbmuxd libimobiledevice
sudo systemctl enable usbmuxd.service
sudo systemctl start usbmuxd.service
```
