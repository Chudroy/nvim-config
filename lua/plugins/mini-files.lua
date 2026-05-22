return {
  {
    "nvim-mini/mini.files",
    opts = function(_, opts)
      opts.content = opts.content or {}
      opts.content.filter = function(entry)
        return not vim.startswith(entry.name, ".")
      end

      opts.options = opts.options or {}
      opts.options.permanent_delete = false
    end,
    init = function()
      local show_dotfiles = false

      local filter_show = function()
        return true
      end

      local filter_hide = function(entry)
        return not vim.startswith(entry.name, ".")
      end

      local group = vim.api.nvim_create_augroup("user_minifiles_hidden_default", { clear = true })

      vim.api.nvim_create_autocmd("User", {
        group = group,
        pattern = "MiniFilesExplorerOpen",
        callback = function()
          show_dotfiles = false
          require("mini.files").refresh({
            content = {
              filter = filter_hide,
            },
          })
        end,
      })

      vim.api.nvim_create_autocmd("User", {
        group = group,
        pattern = "MiniFilesBufferCreate",
        callback = function(args)
          vim.schedule(function()
            vim.keymap.set("n", "g.", function()
              show_dotfiles = not show_dotfiles
              require("mini.files").refresh({
                content = {
                  filter = show_dotfiles and filter_show or filter_hide,
                },
              })
            end, {
              buffer = args.data.buf_id,
              desc = "Toggle hidden files",
            })
          end)
        end,
      })
    end,
  },
}
