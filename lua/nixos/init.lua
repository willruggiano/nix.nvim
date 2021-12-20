local M = {}

M.rebuild = function(background, args)
  require("nix.lib").run_command {
    cmd = table.merge({ "sudo", "nixos-rebuild", "switch" }, args),
    cwd = vim.fn.getcwd(),
    filetype = "log",
    title = "nixos-rebuild-switch",
    output_qf = background,
    is_background_job = background,
    notify = background,
  }
end

return M
