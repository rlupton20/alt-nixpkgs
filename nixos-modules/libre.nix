{ config, pkgs, lib, ... }:
{
  # Block any unfree firmware (which isn't in the kernel)
  nixpkgs.config = {
    blacklistedLicenses = with lib.licenses; [ 
      unfreeRedistributableFirmware 
    ];
  };

  # Build a libre kernel (no unfree firmware)
  boot.kernelPackages = pkgs.linuxPackages_custom {
    version = "4.12.10-gnu";
    src = pkgs.fetchurl {
      url = "http://www.linux-libre.fsfla.org/pub/linux-libre/releases/4.12.10-gnu/linux-libre-4.12.10-gnu.tar.xz";
      sha256 = "122a457b0def2050378359641cce341c4d5f3f3dc70d9c55d58ac82ccfaf361b";
    };
    configfile = /etc/nixos/kernel.config;
  };
}
