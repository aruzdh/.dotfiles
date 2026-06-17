return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local colors = require("onedarkpro.helpers").get_colors()

    local c = {
      bg = "NONE",
      fg = colors.fg,
      muted = colors.gray,
      active = colors.blue,
      red = colors.red,
      green = colors.green,
      yellow = colors.yellow,
      cyan = colors.cyan,
    }

    local transparent_theme = {
      normal = {
        c = { bg = "NONE", fg = colors.fg },
        x = { bg = "NONE", fg = colors.fg },
      },
      inactive = {
        c = { bg = "NONE", fg = colors.gray },
        x = { bg = "NONE", fg = colors.gray },
      },
    }

    local function get_lsp_name()
      local clients = vim.lsp.get_clients({ bufnr = 0 })
      for _, client in ipairs(clients) do
        if client.name ~= "ruff" then
          return client.name
        end
      end
      return "No Active Lsp"
    end

    local conditions = {
      buffer_not_empty = function()
        return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
      end,
      hide_in_width = function()
        return vim.fn.winwidth(0) > 80
      end,
    }

    require("lualine").setup({
      options = {
        component_separators = "",
        section_separators = "",
        theme = transparent_theme,
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
            color = { fg = c.active },
            padding = { left = 0, right = 1 },
          },
          {
            function()
              return vim.fn.mode()
            end,
            icon = "",
            color = { fg = c.active, gui = "bold" },
            padding = { right = 1 },
          },
          {
            "filesize",
            cond = conditions.buffer_not_empty,
            color = { fg = c.muted },
          },
          {
            "filename",
            file_status = true,
            path = 4,
            cond = conditions.buffer_not_empty,
            color = { fg = c.red, gui = "bold" },
          },
          { "location", color = { fg = c.muted } },
          { "progress", color = { fg = c.muted } },
          {
            "diagnostics",
            sources = { "nvim_diagnostic" },
            symbols = { error = " ", warn = " ", info = " " },
            diagnostics_color = {
              error = { fg = c.red },
              warn = { fg = c.yellow },
              info = { fg = c.cyan },
            },
          },
          {
            function()
              return "%="
            end,
          },
          {
            get_lsp_name,
            icon = " LSP:",
            color = { fg = colors.yellow },
          },
        },

        lualine_x = {
          {
            "filetype",
            colored = false,
            icon_only = false,
            color = { fg = c.muted },
          },
          {
            "branch",
            icon = "",
            color = { fg = colors.purple },
          },
          {
            "diff",
            symbols = { added = "+", modified = "~", removed = "-" },
            diff_color = {
              added = { fg = c.green },
              modified = { fg = c.yellow },
              removed = { fg = c.red },
            },
            cond = conditions.hide_in_width,
          },
          {
            function()
              return "░▒▓"
            end,
            color = { fg = c.active },
            padding = { left = 1 },
          },
        },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        lualine_c = {},
        lualine_x = {},
      },
    })
  end,
}
