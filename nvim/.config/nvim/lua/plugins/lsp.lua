return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        clangd = {
          cmd = {
            "clangd",
            "--background-index",
            "--clang-tidy",
          },
          init_options = {
            fallbackFlags = { "--std=c23" },
          },
          filetypes = { "c", "cpp", "objc", "objcpp" },
        },
      },
      diagnostics = {
        update_in_insert = true,
        virtual_text = {
          prefix = "🐛",
        },
      },
    },
  },
}
