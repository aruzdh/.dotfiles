return {
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
          -- fallbackFlags = { "--std=c23" },
        },
        filetypes = { "c", "cpp", "objc", "objcpp" },
      },
      tinymist = {
        on_attach = function(client, bufnr)
          vim.keymap.set("n", "<leader>tp", function()
            client:exec_cmd({
              title = "pin",
              command = "tinymist.pinMain",
              arguments = { vim.api.nvim_buf_get_name(0) },
            }, { bufnr = bufnr })
          end, { desc = "Tinymist Pin", noremap = true })

          vim.keymap.set("n", "<leader>tu", function()
            client:exec_cmd({
              title = "unpin",
              command = "tinymist.pinMain",
              arguments = { vim.v.null },
            }, { bufnr = bufnr })
          end, { desc = "Tinymist Unpin", noremap = true })
        end,
      },
    },
    diagnostics = {
      update_in_insert = true,
      virtual_text = {
        prefix = "🐛",
      },
    },
  },
}
