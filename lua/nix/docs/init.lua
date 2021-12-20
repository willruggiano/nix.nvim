local lib = require "nix.lib"

return function(background, args)
  lib.nix_command(background, { title = "emanote", output_qf = false }, "run", ".#docs", args)
end
