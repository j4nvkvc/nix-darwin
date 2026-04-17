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

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 6;
}
# darwin https://github.com/nix-darwin/nix-darwin/archive/nix-darwin-25.11.tar.gz
# home-manager https://github.com/nix-community/home-manager/archive/release-25.11.tar.gz
# nixpkgs https://nixos.org/channels/nixpkgs-25.11-darwin#
# nix-build '<darwin>' -A darwin-rebuild
# sudo ./result/bin/darwin-rebuild switch -I darwin-config=/etc/nix-darwin/configuration.nix
