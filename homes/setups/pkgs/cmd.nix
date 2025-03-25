{pkgs, ...}: {
  home.packages = with pkgs; [
    grc # fish

    # command
    # bat
    tree
    ripgrep

    nur.repos.mic92.hello-nur
    unstable.bat
  ];
}
