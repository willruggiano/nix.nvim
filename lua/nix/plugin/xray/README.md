# xray plugin

xray helps you manage nix dependencies; basically [crates.nvim][crates] but for nix.

## Features

- Show revision status relative to upstream:
  - [Flake][flakes] support for flake.nix and flake.lock files
  - [niv][niv] support for sources.json files
  - fetch call (e.g. `fetchgit`, `fetchFromGitHub`) support

... and many more [planned features](./FEATURES.xit)

## Configuration

```lua
require("nix").setup {
  xray = true, -- for the default configuration
  -- which is...
  xray = {
    flakes = {
      include = { "flake.nix", "flake.lock" },
    },
    fetch_calls = {
      include = { "fetchgit", "fetchFromGitHub" },
    },
    niv = {
      include = { "**/sources.json" },
    },
  },
}
```

[crates]: https://github.com/Saecki/crates.nvim
[flakes]: https://nixos.wiki/wiki/Flakes
