return {
  "chomosuke/typst-preview.nvim",
  lazy = false,
  version = "1.*",
  opts = {
    get_root = function(path_of_main_file)
      local rp = vim.fn.resolve(path_of_main_file)
      return vim.fn.fnamemodify(rp, ":p:h")
    end,

    get_main_file = function(current_file_path)
      local s_dir = vim.fn.resolve(vim.fn.fnamemodify(current_file_path, ":p:h"))
        or vim.fn.fnamemodify(current_file_path, ":p:h")

      while true do
        local marker_path = s_dir .. "/.typst_main_file"

        if vim.fn.filereadable(marker_path) == 1 then
          local main_fname = vim.fn.readfile(marker_path)[1]
          if main_fname then
            main_fname = main_fname:gsub("%s*$", "")
            local main_fpath = s_dir .. "/" .. main_fname
            local resolved_main_f = vim.fn.resolve(main_fpath)
            if resolved_main_f and vim.fn.filereadable(resolved_main_f) == 1 then
              return resolved_main_f
            end
          end
        end

        local p_dir = s_dir:match("(.*)/[^/]+$")
        if not p_dir then
          p_dir = "/"
        elseif p_dir == "" and s_dir ~= "/" then
          p_dir = "/"
        end

        if p_dir == s_dir or p_dir == "/" then
          break
        end
        s_dir = p_dir
      end
      return current_file_path
    end,
  },
}
