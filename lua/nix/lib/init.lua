local lib = {}

lib.error = function(msg)
  error("[nix.nvim] " .. msg)
end

lib.info = function(msg)
  print("[nix.nvim] " .. msg)
end

lib.tbl_merge = function(t0, t1)
  for _, v in ipairs(t1) do
    table.insert(t0, v)
  end
  return t0
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
    cmd = lib.tbl_merge({ "nix" }, args),
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
