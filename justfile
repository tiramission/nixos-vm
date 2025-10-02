fmt:
        alejandra .

add: fmt
        git add .

commit MSG: add
        git commit -m "{{MSG}}"

repl M="wsl-nixos": add
        nix repl .#nixosConfigurations.{{M}}

rf: add
        nix repl --expr 'builtins.getFlake (toString ./.)'

up:
        nix flake update

switch: add
        nh os switch . --ask

apply: add
        nh os switch .