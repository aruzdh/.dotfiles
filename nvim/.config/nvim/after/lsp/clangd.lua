return {
  cmd = {
    "clangd",
    "--background-index",
    "--clang-tidy",
  },
  init_options = {
    -- fallbackFlags = { "--std=c23" },
  },
  filetypes = { "c", "cpp", "objc", "objcpp" },
}
