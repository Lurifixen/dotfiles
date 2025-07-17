return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "frappe",
      transparent_background = true,
      styles = {
        comments = { "italic" },
      },
    })
    vim.cmd.colorscheme("catppuccin")
  end,
}
-- return {
--   "ellisonleao/gruvbox.nvim",
--   name = "gruvbox",
--   priority = 1000,
--   config = function()
--     require("gruvbox").setup({})
--     vim.cmd.colorscheme("gruvbox")
--   end,
-- }
