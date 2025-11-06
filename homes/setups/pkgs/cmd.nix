{pkgs, ...}: {
  home.packages = with pkgs; [
    grc # fish

    # command
    # bat
    tree
    ripgrep
    just

    nur.repos.mic92.hello-nur
    unstable.bat
    unstable.uv
    unstable.nh
    unstable.claude-code
  ];

  home.sessionPath = [
    "$HOME/.local/bin"
    "$HOME/go/bin"
  ];
}
