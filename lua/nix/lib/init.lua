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

lib.run_command = function(opts)
  vim.validate {
    opts = { opts, "table" },
  }
  local job_ctrl = require "firvish.job_control"
  job_ctrl.start_job(opts)
end

lib.nix_command = function(background, opts, ...)
  local args = vim.tbl_flatten { ... }
  lib.run_command {
    cmd = table.merge({ "nix" }, args),
    cwd = vim.fn.getcwd(),
    filetype = "log",
    title = "nix",
    output_qf = background,
    is_background_job = background,
    notify = background,
  }
end

return lib
