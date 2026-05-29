return {
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        sources = {
          explorer = {
            focus = "list",

            -- Show gitignored files/folders by default.
            ignored = true,

            -- Also show dotfiles like .env, .github, .gitignore.
            hidden = true,

            actions = {
              explorer_yank_cwd = function(picker)
                local paths = {}

                if vim.fn.mode():find("^[vV]") then
                  picker.list:select()
                end

                for _, item in ipairs(picker:selected({ fallback = true })) do
                  -- Use the real file path from the picker item.
                  -- Do NOT use the rendered explorer line.
                  local path = item.file

                  if type(path) == "string" and path ~= "" then
                    local rel = vim.fn.fnamemodify(path, ":.")
                    table.insert(paths, rel)
                  end
                end

                picker.list:set_selected()

                if #paths == 0 then
                  Snacks.notify.warn("No file path found")
                  return
                end

                local value = table.concat(paths, "\n")

                vim.fn.setreg("+", value, "l")
                vim.fn.setreg('"', value, "l")

                Snacks.notify.info("Copied relative path")
              end,
            },

            win = {
              list = {
                keys = {
                  -- Keep default `y` untouched: absolute path.
                  -- Add uppercase `Y`: relative path from :pwd.
                  ["Y"] = { "explorer_yank_cwd", mode = { "n", "x" } },
                },
              },
            },
          },
        },
      },
    },
  },
}
