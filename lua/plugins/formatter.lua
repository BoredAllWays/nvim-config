return {
  {
    "stevearc/conform.nvim",
    config = function()
      local conform = require("conform")
      
      conform.setup({
        formatters_by_ft = {
          python = { "black" },
          c = { "clang-format" },
          cpp = { "clang-format" },
          dart = { "dart_format" },
        },
        -- Automatically format when you save the file!
        format_on_save = {
          lsp_fallback = true,
          timeout_ms = 500,
        },
      })

      -- Shortcut: Space + f + m to manually format
      vim.keymap.set({ "n", "v" }, "<leader>fm", function()
        conform.format({
          lsp_fallback = true,
          async = false,
          timeout_ms = 500,
        })
      end)
    end,
  }
}

