{pkgs, ...}: {
  programs.git = {
    enable = true;
    userName = "tiramission";
    userEmail = "37465086+tiramission@users.noreply.github.com";
    extraConfig = {
      safe.directory = "*";
      core.quotepath = false;
      init.defaultBranch = "main";
    };
  };

  programs.gh = {
    enable = true;
    package = pkgs.unstable.gh;
  };
}
