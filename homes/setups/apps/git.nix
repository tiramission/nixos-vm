{pkgs, ...}: {
  programs.git = {
    enable = true;
    settings = {
      user.name = "tiramission";
      user.email = "37465086+tiramission@users.noreply.github.com";
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
