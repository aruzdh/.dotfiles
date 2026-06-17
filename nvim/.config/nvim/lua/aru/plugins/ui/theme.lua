return {
  {
    "olimorris/onedarkpro.nvim",
    priority = 1000,
    opts = {
      highlights = {
        coqVernacCmd = { fg = "${orange}", italic = true, bold = true }, -- Theorem, Lemma, etc.
        coqProofDelim = { fg = "${purple}", bold = true }, -- Proof, Qed
        coqThmName = { fg = "${blue}" }, -- The name of your theorem
        coqTactic = { fg = "${cyan}", bold = true }, -- intros, apply, symmetry
        coqProofBody = { fg = "${red}" }, -- Proof body
        coqThmTerm = { fg = "${blue}" }, -- Statment variables
        coqKwdParen = { fg = "${blue}" }, -- Statment quantified variables
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = function()
        local handle = io.popen("defaults read -g AppleInterfaceStyle 2>/dev/null")
        local is_dark = false

        if handle then
          local result = handle:read("*a")
          handle:close()
          if result and result:match("Dark") then
            is_dark = true
          end
        end

        if is_dark then
          vim.cmd("colorscheme vaporwave")
        else
          vim.cmd("colorscheme onelight")
        end
      end,
    },
  },
}
