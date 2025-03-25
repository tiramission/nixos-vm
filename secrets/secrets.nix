let
  pks = ["ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDhmSdP4sVoCQy7I72E4LBg77WA0dZYeUQHNOlNnD0M6"];
in {
  "user-password.age".publicKeys = pks;
}
