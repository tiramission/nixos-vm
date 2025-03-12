## 使用方式

1. 克隆仓库
```bash
git clone https://github.com/tiramission/nixos-config -b hyperv
cd nixos-config
```
2. 分区磁盘
```bash
sudo nix --extra-experimental-features 'nix-command flakes' run nixpkgs#disko -- -m disko -f .#hyperv
```
3. 安装系统
```bash
sudo nixos-install --option substituters https://mirrors.ustc.edu.cn/nix-channels/store --flake .#nixos
```
