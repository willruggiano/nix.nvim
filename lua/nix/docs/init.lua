local job_ctrl = require "firvish.job_control"

return function(background, opts)
  background = background or false
  opts = opts or {}
  job_ctrl.start_job {
    cmd = table.merge({ "nix", "run", ".#docs" }, opts),
    cwd = vim.fn.getcwd(),
    filetype = "log",
    title = "nix-run",
    output_qf = false,
    is_background_job = background,
    notify = background,
  }
end
