local vscoq_bin = vim.fn.expand("~/.opam/rocq/bin/vscoqtop")

return {
  cmd = { vscoq_bin, "--stdio" },
  filetypes = { "coq" },
  root_markers = { "_CoqProject", ".git" },
  settings = {
    vscoq = {
      proof = {
        mode = "Continuous",
        delegation = "All",
      },
      completion = { enable = true },
    },
  },
}
