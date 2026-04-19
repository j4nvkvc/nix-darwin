{pkgs, ...}: let
  username = "j4nvkvc";
  useremail = "j4nvkvc@pm.me";
  hostname = "pc";
in {
  imports = [
    (import ./system {
      inherit
        pkgs
        username
        useremail
        hostname
        ;
    })
    <home-manager/nix-darwin>
    {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = false;
      home-manager.extraSpecialArgs = {inherit pkgs username useremail hostname;};
      home-manager.backupFileExtension = "backup";
      home-manager.users.${username} = import ./home;
    }
  ];
}
# curl -sSf -L https://install.lix.systems/lix | sh -s -- install
# sudo nix-channel --add https://github.com/nixos/nixpkgs/archive/nixpkgs-25.11.tar.gz nixpkgs
# sudo nix-channel --add https://github.com/nix-darwin/nix-darwin/archive/nix-darwin-25.11.tar.gz darwin
# sudo nix-channel --add https://github.com/nix-community/home-manager/archive/release-25.11.tar.gz home-manager
# /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# nix-build '<darwin>' -A darwin-rebuild
# sudo ./result/bin/darwin-rebuild switch -I darwin-config=/etc/nix-darwin/configuration.nix
