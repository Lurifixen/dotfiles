return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		vim.cmd.colorscheme "catppuccin-frappe"
	end
}

-- return {
--   -- add gruvbox
--   {
--     "catppuccin/nvim",
--     opt = {
--       transparent_mode = true,
--       styles = {
--         sidebars = "transparent",
--         float = "transparent",
--       },
--     },
--   },
--
--   -- Configure LazyVim to load gruvbox
--   {
--     "LazyVim/LazyVim",
--     opts = {
--       colorscheme = "catppuccin-frappe",
--     },
--   },
-- }
