local lib = require "nix.lib"

return function(background, args)
  -- TODO: The problem here is that the sources are copied into the /nix/store and so our quickfix
  -- list is fucked :( It'd be nice if nix-build allowed you to specify an output format, akin to
  -- other tools that make it easy for their output to be consumed by vim.
  -- Alternatively, I supposed we could fairly easily snip off the /nix/store/path/to/source base
  -- leaving only the relative filepath? I think that would work.
  lib.nix_command(background, { title = "nix-build" }, "build", "-L", args)
end
