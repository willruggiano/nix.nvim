local M = {}

local default_opts = {
  xray = {
    flakes = {
      include = { "flake.nix", "flake.lock" },
    },
    fetch_calls = {
      include = { "fetchgit", "fetchFromGitHub" },
    },
    niv = {
      include = { "**/sources.json" },
    },
  },
}

M.setup = function(opts)
  vim.validate {
    opts = { opts, "table", true },
  }

  ---@diagnostic disable-next-line: need-check-nil
  if opts.xray then
    ---@diagnostic disable-next-line: need-check-nil
    M.setup_xray(opts.xray)
  end
end

M.setup_xray = function(opts)
  if type(opts) == "boolean" then
    opts = default_opts.xray
  end

  require("nix.plugin.xray").setup(opts)
end

return M
