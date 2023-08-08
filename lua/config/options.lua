vim.g.neovide_padding_top = 10
vim.g.neovide_scroll_animation_length = 0.25
vim.g.neovide_cursor_vfx_mode = "railgun"
vim.g.neovide_cursor_vfx_particle_lifetime = 1.5
vim.g.neovide_cursor_vfx_particle_density = 15
vim.g.heirline_bufferline = true
vim.g.inlay_hints_enabled = true
vim.g.blend = (vim.g.neovide and 5) or (vim.env.WEZTERM and 3) or 0
vim.g.border = "none_cmp_fix"

vim.o.guifont = "VictorMono_Nerd_Font,Symbols_Nerd_Font:h13.5:#e-subpixelantialias:#h-full"

vim.o.autoread = true
vim.o.winwidth = 10
vim.o.winminwidth = 10
vim.o.equalalways = true
vim.o.winblend = vim.g.blend
vim.o.pumblend = vim.g.blend
vim.o.shell = vim.fn.executable "pwsh" and "pwsh" or "powershell"
-- vim.opt.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
vim.o.shellcmdflag =
  "-NoLogo -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.UTF8Encoding]::new();$PSDefaultParameterValues['Out-File:Encoding']='utf8';Remove-Alias -Force -ErrorAction vim.opt.SilentlyContinue tee;"
vim.o.shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait"
vim.o.shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
vim.o.shellquote = ""
vim.o.shellxquote = ""
-- vim.opt.spell = true
