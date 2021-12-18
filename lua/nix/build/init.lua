local job_ctrl = require "firvish.job_control"

return function(background, opts)
  job_ctrl.start_job {
    -- TODO: The problem here is that the sources are copied into the /nix/store and so our quickfix
    -- list is fucked :( It'd be nice if nix-build allowed you to specify an output format, akin to
    -- other tools that make it easy for their output to be consumed by vim.
    -- Alternatively, I supposed we could fairly easily snip off the /nix/store/path/to/source base
    -- leaving only the relative filepath? I think that would work.
    cmd = table.merge({ "nix", "build", "-L" }, opts),
    cwd = vim.fn.getcwd(),
    filetype = "log",
    title = "nix-build",
    output_qf = background,
    is_background_job = background,
    notify = background,
  }
end
