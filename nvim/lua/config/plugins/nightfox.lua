return {
  "EdenEast/nightfox.nvim",
  config = function()
    vim.cmd("colorscheme nordfox")
    vim.cmd("highlight! link WinSeparator GlyphPalette2")
    vim.cmd("highlight! Visual guibg=#4a3332")
  end,
}
