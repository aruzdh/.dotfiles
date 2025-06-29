local map = vim.keymap.set

-- UNDOTREETOGGLE
map("n", "<leader>t", function()
  vim.cmd.UndotreeToggle()
end, { desc = "UndoTreeToggle" })

-- TYPST PREVIEW
map("n", "<leader>p", function()
  vim.cmd.TypstPreview()
end, { desc = "Typst Preview" })
