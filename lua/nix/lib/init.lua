local has_notify, notify = pcall(require, "notify")
if not has_notify then
  print "nvim-notify not installed, all output will be printed to stdout/stderr"
end

local function show_message(msg, error)
  if has_notify then
    local level = (error and "error") or "info"
    notify(msg, level, { title = "nix.nvim" })
  else
    if error then
      error("[nix.nvim] " .. msg)
    else
      print("[nix.nvim] " .. msg)
    end
  end
end

local lib = {}

lib.error = function(msg)
  show_message(msg, true)
end

lib.info = function(msg)
  show_message(msg)
end

return lib
