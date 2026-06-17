local function apply_custom_highlights()
  local hl = vim.api.nvim_set_hl
  local is_light = vim.o.background == "light"
  local cc_bg = is_light and "#286983" or "#ea9d34"
  local rocq_checked = is_light and "#DFEE9B" or "#4D5433"
  local comment_color = is_light and "#666666" or "#eeeeee"

  local bold_style = { bold = true }
  local dim_style = { fg = "#666666" }
  local comment_style = { fg = comment_color, italic = true }

  local highlights = {
    Comment = comment_style,
    ["@comment"] = { link = "Comment" },
    NonText = dim_style,

    Keyword = bold_style,
    ["@keyword"] = { link = "Keyword" },
    ["@type"] = bold_style,
    ["@constant"] = bold_style,

    Delimiter = bold_style,
    ["@operator"] = bold_style,

    LspReferenceText = { fg = "#000000", bg = "#A2BE20", bold = true },
    LspReferenceRead = { link = "LspReferenceText" },
    LspReferenceWrite = { link = "LspReferenceText", underline = true },
    CoqtailChecked = { bg = rocq_checked },

    ColorColumn = { bg = cc_bg },
  }

  for group, settings in pairs(highlights) do
    hl(0, group, settings)
  end
end

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = apply_custom_highlights,
})

apply_custom_highlights()
