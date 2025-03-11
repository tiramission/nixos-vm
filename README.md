## 使用方式

1. 克隆仓库
```bash
git clone https://github.com/tiramission/nixos-config -b hyperv
cd nixos-config
```
2. 分区磁盘
```bash
nix-shell -p disko
disko -m disko -f .#hyperv
```
3. 安装系统
```bash
nixos-install --flake .#nixos
```
