return {
  "echasnovski/mini.comment",
  event = "VeryLazy",
  opts = {
    options = {
      -- Function to dynamically set commentstring based on filetype
      custom_commentstring = function()
        local ft = vim.bo.filetype
        if ft == "sml" then
          return "(* %s *)"
        end
        -- Default commentstring for other filetypes
        return vim.bo.commentstring
      end,
    },
    mappings = {
      comment = "gc",
      comment_line = "gcc",
      comment_visual = "gc",
      textobject = "gc",
    },
  },
}
