return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          theme = "kanagawa", -- Perfectly syncs with your color scheme!
          icons_enabled = true,
          component_separators = { left = "｜", right = "｜" },
          section_separators = { left = "", right = "" },
        }
      })
    end
  }
}
