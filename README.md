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

## Commands

#### :Nix[!]

The `Nix` command is a general purpose `nix` wrapper. Think `:Git` from vim-fugitive.
When given, <bang> will cause the command to run in the background and it's output be redirected to a quickfix list.

#### :NixBuild[!]

The `NixBuild` command executes `nix build -L` in the current directory, which will build the defaultPackage for the [flake][flakes] in the current directory.
When given, <bang> will cause the command to run in the background and it's output be redirected to a quickfix list.

#### :NixDocs[!]

The `NixDocs` command executes `nix run .#docs` in the current directory.
This command by default runs in the **background**. To cause it to run in the foreground, use the <bang> version.

**Note that this command requires that your flake has a "docs" app.** See [this example][particle] which starts a [Emanote][emanote] webserver that hosts markdown documentation.

## Lua API

#### Wrapper methods
```lua
-- require("nix")

-- Runs `nix build -L`
-- @param background whether to run the command in the background
-- @param[opt] args additional arguments to pass to the command
-- @usage require("nix").build(true, { ".#myPackage" })
-- @see nix_command()
build(background, args)


-- Runs `nix run .#docs`
-- @param background whether to run the command in the background
-- @param[opt] args additional arguments to pass to the command
-- @usage require("nix").docs(true, {})
-- @see nix_command()
docs(background, args)



-- Runs an arbitrary nix command
-- @param background whether to run the command in the background
-- @param args additional arguments to pass to the command
-- @usage require("nix").nix(false, "flake", "show")
-- @see nix_command()
nix(background, args)
```

#### Library methods

```lua
-- require("nix.lib")

-- Spawns a firvish job that executes the specified nix command
-- @param background whether to run the command in the background
-- @param[opt] opts options to pass to `firvish.job_control.start_job`
-- @param ... arguments to pass to the command 
-- @usage require("nix.lib").nix_command(true, { title = "flake-show" }, "flake", "show")
nix_command(background, opts, ...)
```

Make sure to check out [firvish.nvim][firvish]!

[emanote]: https://note.ema.srid.ca/
[firvish]: https://github.com/Furkanzmc/firvish.nvim
[flakes]: https://nixos.wiki/wiki/Flakes
[particle]: https://github.com/willruggiano/particle/blob/main/flake.nix
