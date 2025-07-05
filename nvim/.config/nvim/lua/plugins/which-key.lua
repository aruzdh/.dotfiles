return {
  "folke/which-key.nvim",
  opts = {
    win = {
      border = "single",
    },
  },
  config = function(_, opts)
    require("which-key").setup(opts)

    if vim.g.colors_name == "komau" then
      local background = "#f1eee0"
      vim.api.nvim_set_hl(0, "FloatBorder", { fg = background, bg = background })
      vim.api.nvim_set_hl(0, "WhichKeyBorder", { fg = background, bg = background })
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = background })
    end
  end,
}
