return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local colors = {
      bg = "#050A0F",
      fg = "#7EE6F2",
      glow = "#D0FFFF",
      dim = "#2A5A70",
      bright = "#BFFFFF",
      subtle = "#1E455A",
      visual = "#1A3F54",
      pink = "#FF99AA",
      green = "#88FF99",
      gold = "#F0CD66",
      blue = "#88EEFF",
    }

    local function get_lsp_name()
      local clients = vim.lsp.get_clients({ bufnr = 0 })
      for _, client in ipairs(clients) do
        if client.name ~= "ruff" then
          return client.name:upper()
        end
      end
      return "OFFLINE"
    end

    require("lualine").setup({
      options = {
        component_separators = "",
        section_separators = "",
        theme = {
          normal = { c = { fg = colors.fg, bg = "NONE" } },
          inactive = { c = { fg = colors.dim, bg = "NONE" } },
        },
      },
      sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        lualine_c = {
          {
            function()
              return "▓▒░"
            end,
            color = { fg = colors.subtle },
            padding = { left = 0, right = 1 },
          },
          {
            function()
              return "OP: " .. vim.fn.mode():upper()
            end,
            color = { fg = colors.bright, gui = "bold" },
          },
          {
            "filename",
            file_status = true,
            path = 4,
            color = { fg = colors.glow, gui = "bold" },
          },
          {
            "diagnostics",
            symbols = { error = "!", warn = "?", info = "i" },
            diagnostics_color = {
              error = { fg = colors.pink },
              warn = { fg = colors.gold },
              info = { fg = colors.blue },
            },
          },
          {
            function()
              return "%="
            end,
          },
          {
            get_lsp_name,
            icon = "SYSTEM:",
            color = { fg = colors.green },
          },
        },
        lualine_x = {
          { "branch", icon = "", color = { fg = colors.blue } },
          {
            "diff",
            symbols = { added = "+", modified = "~", removed = "-" },
            diff_color = {
              added = { fg = colors.green },
              modified = { fg = colors.gold },
              removed = { fg = colors.pink },
            },
          },
          {
            function()
              return "░▒▓"
            end,
            color = { fg = colors.subtle },
            padding = { left = 1 },
          },
        },
      },
    })
  end,
}
