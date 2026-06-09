return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").setup({
      ensure_installed = { 
        "c", "cpp", "python", "javascript", "typescript", "dart", 
        "lua", "vim", "vimdoc",
        "json", "yaml", "html", "css", "bash", "markdown"
      },
      highlight = { enable = true },
      indent = { enable = true },
    })
  end
}

