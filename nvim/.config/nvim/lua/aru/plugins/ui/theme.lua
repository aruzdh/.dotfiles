return {
  {
    "olimorris/onedarkpro.nvim",
    priority = 1000,
    opts = {
      highlights = {
        ["@keyword.vernacular"] = { fg = "${orange}", italic = true, bold = true },
        ["@keyword.proof"] = { fg = "${purple}", italic = true, bold = true },
        ["@keyword.control"] = { fg = "${purple}", italic = true, bold = true },
        ["@keyword.directive"] = { fg = "${purple}", italic = true, bold = true },

        ["@function.theorem"] = { fg = "${red}", bold = true },
        ["@function.definition"] = { fg = "${blue}", bold = true },
        ["@function.call"] = { fg = "${blue}" },

        ["@type"] = { fg = "${yellow}" },
        ["@constructor"] = { fg = "${green}" },

        ["@tactic"] = { fg = "${cyan}", bold = true },
        ["@variable.rocq"] = { fg = "${green}" },
        ["@variable.parameter"] = { fg = "${red}", italic = true },
        ["@variable.builtin"] = { fg = "${red}" },

        ["@operator.rocq"] = { fg = "${red}" },
        ["@punctuation.delimiter"] = { fg = "${blue}" },
        ["@punctuation.bracket"] = { fg = "${blue}" },
        ["@comment"] = { fg = "${blue}", italic = true },
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
