vim.cmd [[command! -bang -narg=* NixBuild :lua require"nix".build("<bang>" == "!", {<f-args>})]]
