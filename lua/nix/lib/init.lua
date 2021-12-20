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
  local ok, job_ctrl = pcall(require, "firvish.job_control")
  if not ok then
    lib.error "firvish.nvim is a required dependency, please install it"
    return
  end
  vim.validate {
    opts = { opts, "table" },
  }
  job_ctrl.start_job(opts)
end

lib.nix_command = function(background, opts, ...)
  vim.validate {
    background = { background, "boolean" },
    opts = { opts, "table", true },
  }
  local args = vim.tbl_flatten { ... }
  local job = {
    cmd = table.merge({ "nix" }, args),
    cwd = vim.fn.getcwd(),
    filetype = "log",
    title = "nix",
    output_qf = background,
    is_background_job = background,
    notify = background,
  }
  lib.run_command(vim.tbl_extend("force", job, opts or {}))
end

return lib
