return {
  "tomtomjhj/vsrocq.nvim",
  dependencies = { "neovim/nvim-lspconfig" },
  ft = { "coq", "rocq", "v" },
  opts = {
    render = { split = "vertical" },
    vsrocq = {
      proof = {
        mode = "Continuous",
      },
      completion = {
        enable = true,
        algorithm = "SplitTypeIntersection",
      },
      goals = {
        diff = {
          mode = "on",
        },
        messages = {
          full = true,
        },
      },
    },
  },
}
