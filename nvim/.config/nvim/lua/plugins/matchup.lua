return {
  "andymass/vim-matchup",
  config = function()
    -- Match-up specific settings
    vim.g.matchup_matchparen_offscreen = { method = "popup" }

    -- Delay highlight settings to make sure they aren't overwritten
    vim.schedule(function()
      vim.api.nvim_set_hl(0, "MatchParen", { fg = "#1e1e2e", bg = "#A2BE20", bold = true })
      vim.api.nvim_set_hl(0, "MatchParenCur", { fg = "#1e1e2e", bg = "#A2BE20", bold = true })
      vim.api.nvim_set_hl(0, "MatchWordCur", { fg = "#1e1e2e", bg = "#A2BE20", bold = true })
    end)
  end,
}
