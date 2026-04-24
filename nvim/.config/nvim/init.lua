-- 1. Load lazy.nvim and its configuration
-- (This file already calls lazy.setup("aru.plugins"), loading all your plugins)
require("aru.lazy")

-- 2. Load your core configuration files individually
require("aru.core.options")
require("aru.core.keymaps")
require("aru.core.autocmds")
