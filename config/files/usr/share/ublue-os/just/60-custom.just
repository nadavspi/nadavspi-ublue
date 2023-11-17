!include /usr/share/ublue-os/just/100-bling.just

dotfiles-clone: 
  nix run "https://flakehub.com/f/ublue-os/fleek/*.tar.gz" -- join git@github.com:nadavspi/dotfiles.git && nix run "https://flakehub.com/f/ublue-os/fleek/*.tar.gz" -- apply


