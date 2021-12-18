local lib = require "nix.lib"

return function(background, args)
  lib.nix_command(background, { title = "emanote" }, "run", ".#docs", args)
end
