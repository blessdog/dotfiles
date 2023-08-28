-- set colorscheme to gruvbox with protected call
-- in case it isn't installed
local status, _ = pcall(vim.cmd, "colorscheme gruvbox")
if not status then
  print("Colorscheme not found!") -- print error if colorscheme not installed
  return
end
vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])


-- function to set a clear background
function ColorMyPencils(color)
  color = color or "gruvbox"
  vim.cmd.colorscheme(color)

  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

end

ColorMyPencils()
