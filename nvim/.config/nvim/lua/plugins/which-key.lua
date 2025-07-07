return {
  "folke/which-key.nvim",
  opts = {
    win = {
      border = "single",
    },
  },
  config = function(_, opts)
    require("which-key").setup(opts)

    if vim.g.colors_name == "paper" then
      local background = "#f2eede"
      vim.api.nvim_set_hl(0, "FloatBorder", { fg = background })
    end
  end,
}
