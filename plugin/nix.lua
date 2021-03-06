vim.cmd [[command! -bang -nargs=+ Nix :lua require"nix".nix("<bang>" == "!", {<f-args>})]]
vim.cmd [[command! -bang -nargs=* NixBuild :lua require"nix".build("<bang>" == "!", {<f-args>})]]
vim.cmd [[command! -bang NixDocs :lua require"nix".docs("<bang>" ~= "!", {})]]

vim.cmd [[command! -bang -nargs=+ NixosRebuild :lua require"nixos".rebuild("<bang>" == "!", {<f-args>})]]
