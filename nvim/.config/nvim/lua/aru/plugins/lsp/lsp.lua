return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      prolog = {},
    },
    diagnostics = {
      update_in_insert = true,
      virtual_text = {
        prefix = "🐛",
      },
    },
  },
}
