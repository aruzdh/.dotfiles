return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    bigfile = { enabled = true },
    notifier = {
      enabled = true,
      timeout = 3000, -- default timeout in ms
      width = { min = 40, max = 0.4 },
      height = { min = 1, max = 0.6 },
      -- editor margin to keep free. tabline and statusline are taken into account automatically
      margin = { top = 0, right = 1, bottom = 0 },
      padding = true, -- add 1 cell of left/right padding to the notification window
      sort = { "level", "added" }, -- sort by level and time
      -- minimum log level to display. TRACE is the lowest
      -- all notifications are stored in history
      level = vim.log.levels.TRACE,
      icons = {
        error = " ",
        warn = " ",
        info = " ",
        debug = " ",
        trace = " ",
      },
      keep = function(notif)
        return vim.fn.getcmdpos() > 0
      end,
      ---@type snacks.notifier.style
      style = "compact",
      top_down = true, -- place notifications from top to bottom
      date_format = "%R", -- time format for notifications
      -- format for footer when more lines are available
      -- `%d` is replaced with the number of lines.
      -- only works for styles with a border
      ---@type string|boolean
      more_format = " ↓ %d lines ",
      refresh = 50, -- refresh at most every 50ms
    },
    quickfile = { enabled = true },
    dashboard = {
      enabled = true,
      preset = {
        keys = {
          { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
          { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
          { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
          {
            icon = " ",
            key = "c",
            desc = "Config",
            action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
          },
          { icon = " ", key = "s", desc = "Restore Session", section = "session" },
          {
            icon = " ",
            key = "x",
            desc = "Lazy Extras",
            action = ":LazyExtras",
            enabled = package.loaded.lazy ~= nil,
          },
          { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },
        header = [[
  _ _  ___ _____ _(_)_ __  
 | ' \/ -_) _ \ V / | '  \ 
 |_||_\___\___/\_/|_|_|_|_|
]],
      },
      sections = {
        { section = "header", padding = 4 },
        {
          section = "keys",
          gap = 1,
          padding = 2,
        },
        {
          -- pane = 2,
          icon = " ",
          title = "Recent Files",
          section = "recent_files",
          indent = 2,
          padding = 2,
        },
        {
          icon = " ",
          title = "Projects",
          section = "projects",
          indent = 2,
          padding = 2,
        },
        {
          icon = " ",
          title = "Git Status",
          section = "terminal",
          enabled = true,
          cmd = "git status -sb",
          height = 5,
          padding = 1,
          ttl = 5 * 60,
          indent = 3,
        },
        -- { section = "startup" },
      },
    },
    statuscolumn = { enabled = true },
    words = { enabled = true },
  },
}
