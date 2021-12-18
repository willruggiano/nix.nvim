# nix.nvim

A neovim plugin for better Nix integration.

## Installation

```lua
use {
  "willruggiano/nix.nvim",
  config = function()
    require("nix").setup {}
  end,
  requires = {
    -- Required:
    "Furkanzmc/firvish.nvim",
    -- Optional:
    "rcarriga/nvim-notify",  -- will print to stdout if not installed
  },
}
```

## Features

- A general purpose `:Nix` command
- Create quickfix lists from `nix build`s
- Start a localhost [Emanote](https://note.ema.srid.ca/) webserver via `nix run .#docs`
  - NOTE: You'll need a "docs" app defined in your flake.nix
