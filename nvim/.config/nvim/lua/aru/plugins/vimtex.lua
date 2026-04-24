return {
  {
    "lervag/vimtex",
    lazy = false,
    init = function()
      vim.g.vimtex_view_method = "sioyek"
      vim.g.vimtex_view_sioyek_use_terminal = 1
      vim.g.vimtex_view_sioyek_options = "--reuse-window --nofocus"
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
          "-outdir=build",
        },
      }

      vim.g.vimtex_compiler_latexmk_engines = {
        _ = "-xelatex",
      }
    end,
  },
}
