local map = vim.keymap.set
local scoped = vim.api.nvim_create_autocmd
---------- General ----------

-- UNDOTREETOGGLE
map("n", "<leader>cu", ":UndotreeToggle<CR>", { desc = "UndoTree Toggle", silent = true })

-- RENAME
map("n", "<leader>rn", function()
  local old_word = vim.fn.expand("<cword>")
  vim.ui.input({ prompt = "Rename '" .. old_word .. "' to: " }, function(input)
    if input and input ~= "" then
      vim.cmd(string.format("%%s/\\<%s\\>/%s/gI", old_word, input))
      vim.notify("Renamed " .. old_word .. " to " .. input)
    end
  end)
end, { desc = "Global Search & Replace" })

---------- Specific ----------

-- TYPST
scoped("FileType", {
  pattern = { "typst" },
  callback = function(ev)
    local buf = ev.buf
    map("n", "<leader>tv", ":TypstPreview<CR>", { desc = "Typst Preview", buffer = buf, silent = true })
  end,
})

-- ROCQ

scoped("FileType", {
  pattern = { "coq", "rocq" },
  callback = function(ev)
    local buf = ev.buf

    -- Proof Stepping
    map("n", "<leader>rj", ":VsRocq stepForward<CR>", { desc = "Step Forward", buffer = buf, silent = true })
    map("n", "<leader>rk", ":VsRocq stepBackward<CR>", { desc = "Step Backward", buffer = buf, silent = true })
    map("n", "<leader>rl", ":VsRocq interpretToPoint<CR>", { desc = "Interpret to Point", buffer = buf, silent = true })
    map("n", "<leader>re", ":VsRocq interpretToEnd<CR>", { desc = "Interpret to End", buffer = buf, silent = true })
    map("n", "<leader>rm", ":VsRocq manual<CR>", { desc = "Use manual mode", buffer = buf, silent = true })
    map("n", "<leader>rc", ":VsRocq continuous<CR>", { desc = "Use continuous mode", buffer = buf, silent = true })
    map("n", "<leader>rp", ":VsRocq panels<CR>", { desc = "Open panels", buffer = buf, silent = true })
    map("n", "<leader>rf", ":only<CR>", { desc = "Close panels", buffer = buf, silent = true })

    -- Rocq Search
    map("n", "<leader>rs", function()
      vim.ui.input({ prompt = "Rocq Search: " }, function(input)
        if input and input ~= "" then
          vim.cmd("VsRocq search " .. input)
        end
      end)
    end, { desc = "Safe Rocq Search", buffer = buf, silent = true })

    -- Over
    map("n", "<leader>rr", function()
      local word = vim.fn.expand("<cword>")
      vim.cmd("VsRocq check " .. word)
    end, { desc = "Check word under cursor", buffer = buf, silent = true })

    map("n", "<leader>rw", function()
      local word = vim.fn.expand("<cword>")
      vim.cmd("VsRocq print " .. word)
    end, { desc = "Print word under cursor", buffer = buf, silent = true })
  end,
})

-- Markdown

scoped("FileType", {
  pattern = { "markdown" },
  callback = function(ev)
    local buf = ev.buf
    map("n", "<leader>mv", ":MarkdownPreview<CR>", { desc = "Markdown Preview", buffer = buf, silent = true })
  end,
})
