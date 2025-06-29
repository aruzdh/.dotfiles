return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      ensure_installed = {},
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)

      vim.api.nvim_set_hl(0, "TSBracketBold", { bold = true })
      local brackets = { "@punctuation.bracket", "@punctuation.delimiter" }
      for _, bracket in ipairs(brackets) do
        vim.api.nvim_set_hl(0, bracket, { link = "TSBracketBold" })
      end
    end,
  },
  -- { import = "lazyvim.plugins.extras.lang.json" },
}
