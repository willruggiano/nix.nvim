local lib = require "nix.lib"
if not pcall(require, "firvish") then
  lib.error "firvish.nvim is a required dependency, please install it"
end

local nix = {}

nix.setup = function(opts)
  vim.validate {
    opts = { opts, "table", true },
  }
end

nix.build = require "nix.build"

nix.docs = require "nix.docs"

nix.nix = function(background, args)
  lib.nix_command(background, nil, args)
end

return nix
