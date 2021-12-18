local lib = require "nix.lib"
if not pcall(require, "firvish") then
  lib.error "firvish.nvim is a required dependency, please install it"
end

local nix = {}

nix.setup = function(opts)
  -- TODO:
end

nix.build = require "nix.build"
nix.docs = require "nix.docs"

return nix
