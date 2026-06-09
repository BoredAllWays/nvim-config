return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x", 
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local builtin = require("telescope.builtin")
      
      vim.keymap.set("n", "<C-p>f", builtin.find_files, {})
      vim.keymap.set("n", "<C-g>f", builtin.live_grep, {})

      require("telescope").setup({
        defaults = {
          preview = {
            treesitter = false, 
          }
        }
      })
    end
  }
}
