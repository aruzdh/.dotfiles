local map = vim.keymap.set

-- UNDOTREETOGGLE
map("n", "<leader>cu", function()
  vim.cmd.UndotreeToggle()
end, { desc = "UndoTreeToggle" })

-- TYPST PREVIEW
map("n", "<leader>tv", function()
  vim.cmd.TypstPreview()
end, { desc = "Typst Preview" })
