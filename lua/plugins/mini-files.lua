return {
  {
    "nvim-mini/mini.files",
    opts = function(_, opts)
      opts.options = opts.options or {}
      opts.options.permanent_delete = false

      opts.windows = opts.windows or {}
      opts.windows.width_preview = 60
    end,

    init = function()
      local function notify(message, level)
        vim.notify(message, level or vim.log.levels.INFO, {
          title = "mini.files",
        })
      end

      local function yank_path(relative)
        local MiniFiles = require("mini.files")
        local buf_id = vim.api.nvim_get_current_buf()

        local mode = vim.fn.mode()
        local start_line
        local end_line

        if mode:match("^[vV\22]") then
          start_line = vim.fn.line("v")
          end_line = vim.fn.line(".")

          if start_line > end_line then
            start_line, end_line = end_line, start_line
          end
        else
          start_line = vim.fn.line(".")
          end_line = start_line
        end

        local paths = {}
        local seen = {}

        for line = start_line, end_line do
          local entry = MiniFiles.get_fs_entry(buf_id, line)
          local path = entry and entry.path

          if type(path) == "string" and path ~= "" and not seen[path] then
            seen[path] = true

            if relative then
              path = vim.fn.fnamemodify(path, ":.")
            end

            table.insert(paths, path)
          end
        end

        if #paths == 0 then
          notify("No file path found", vim.log.levels.WARN)
          return
        end

        local value = table.concat(paths, "\n")

        vim.fn.setreg("+", value, "l")
        vim.fn.setreg('"', value, "l")

        notify(relative and "Copied relative path" or "Copied absolute path")
      end

      vim.api.nvim_create_autocmd("User", {
        pattern = "MiniFilesBufferCreate",
        callback = function(args)
          local buf_id = args.data.buf_id

          vim.keymap.set({ "n", "x" }, "gY", function()
            yank_path(false)
          end, {
            buffer = buf_id,
            desc = "Yank absolute path",
          })

          vim.keymap.set({ "n", "x" }, "gy", function()
            yank_path(true)
          end, {
            buffer = buf_id,
            desc = "Yank relative path",
          })
        end,
      })
    end,
  },
}
