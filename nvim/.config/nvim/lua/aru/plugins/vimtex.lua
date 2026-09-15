return {
  {
    "lervag/vimtex",
    lazy = false,
    init = function()
      vim.g.vimtex_view_method = "skim"
      vim.g.vimtex_callback_progpath = "/opt/homebrew/bin/nvim"

      vim.g.vimtex_compiler_latexmk = {
        continuous = 1,
        callback = 1,
        out_dir = "build",
        options = {
          "-interaction=nonstopmode",
          "-synctex=1",
          "-shell-escape",
          "-silent",
        },
      }

      vim.g.vimtex_compiler_latexmk_engines = {
        _ = "-xelatex",
      }
    end,
  },
}
