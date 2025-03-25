{
  config,
  params,
  ...
}: {
  age.identityPaths = ["/home/${params.username}/.ssh/id_ed25519"];
  age.secrets.user-password.file = ../secrets/user-password.age;
}
