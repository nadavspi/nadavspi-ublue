dotfiles-clone: 
  #!/usr/bin/env bash
  set -euo pipefail
  dir=~/src/dotfiles
  if [ -d "$dir" ]; then
    echo "$dir already exists."
    exit
  fi
  mkdir -p ~/src
  cd ~/src
  git clone git@github.com:nadavspi/dotfiles.git

USER := env_var('USER')
HOST := env_var('HOSTNAME')
# Apply home manager config 
apply:
  #!/usr/bin/env bash
  set -euo pipefail
  cd ~/src/dotfiles
  nix run --impure home-manager/master -- -b bak switch --flake .#{{USER}}@{{HOST}}

latest:
  #!/usr/bin/env bash
  set -euo pipefail
  cd ~/src/dotfiles/
  git pull --autostash
  nix run --impure home-manager/master -- -b bak switch --flake .#{{USER}}@{{HOST}}
