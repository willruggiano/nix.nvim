vim.cmd [[command! -bang -narg=* NixBuild :lua require"nix".build("<bang>" == "!", {<f-args>})]]
vim.cmd [[command! -bang NixDocs :lua require"nix".docs("<bang>" ~= "!")]]
