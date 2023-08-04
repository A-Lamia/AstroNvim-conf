local options = {}

options.g = {
  neovide_padding_top = 10,
  neovide_scroll_animation_length = 0.25,
  neovide_cursor_vfx_mode = "railgun",
  neovide_cursor_vfx_particle_lifetime = 1.5,
  neovide_cursor_vfx_particle_density = 15,
  heirline_bufferline = true,
  inlay_hints_enabled = true,
  blend = (vim.g.neovide and 5) or (vim.env.WEZTERM and 3) or 0,
  border = "none_cmp_fix",
}
options.opt = {
  guifont = "VictorMono_Nerd_Font,Symbols_Nerd_Font:h13.5:#e-subpixelantialias:#h-full",
}
options.o = {
  autoread = true,
  winwidth = 10,
  winminwidth = 10,
  equalalways = true,
  winblend = options.g.blend,
  pumblend = options.g.blend,
  shell = vim.fn.executable "pwsh" and "pwsh" or "powershell",
  -- shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;",
  shellcmdflag = "-NoLogo -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.UTF8Encoding]::new();$PSDefaultParameterValues['Out-File:Encoding']='utf8';Remove-Alias -Force -ErrorAction SilentlyContinue tee;",
  shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait",
  shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode",
  shellquote = "",
  shellxquote = "",
  -- spell = true,
}
return options
