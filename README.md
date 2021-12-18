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

## Usage

### Commands

#### :Nix[!]

The `Nix` command is a general purpose `nix` wrapper. Think `:Git` from vim-fugitive.
When given, <bang> will cause the command to run in the background and it's output be redirected to a quickfix list.

#### :NixBuild[!]

The `NixBuild` command executes `nix build -L` in the current directory, which will build the defaultPackage for the [flake][flakes] in the current directory.
When given, <bang> will cause the command to run in the background and it's output be redirected to a quickfix list.

#### :NixDocs[!]

The `NixDocs` command executes `nix run .#docs` in the current directory.
This command by default runs in the **background**. To cause it to run in the foreground, use the <bang> version.

**Note that this command requires that your flake has a "docs" app.** See [this example][example] which starts a [Emanote][emanote] webserver that hosts markdown documentation.

[emanote]: https://note.ema.srid.ca/
[flakes]: https://nixos.wiki/wiki/Flakes
[particle]: https://github.com/willruggiano/particle/blob/main/flake.nix
