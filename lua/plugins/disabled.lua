return {
  -- Copilot
  { "zbirenbaum/copilot.lua", enabled = false },
  { "fang2hou/blink-copilot", enabled = false },

  -- Completion/snippets
  { "rafamadriz/friendly-snippets", enabled = false },

  -- Search/replace
  { "MagicDuck/grug-far.nvim", enabled = false },

  -- Markdown preview
  { "iamcco/markdown-preview.nvim", enabled = false },

  -- TODO comments
  { "folke/todo-comments.nvim", enabled = false },

  -- Database tools
  { "tpope/vim-dadbod", enabled = false },
  { "kristijanhusak/vim-dadbod-ui", enabled = false },
  { "kristijanhusak/vim-dadbod-completion", enabled = false },

  -- Themes, keep only the one you actually use
  { "catppuccin/nvim", name = "catppuccin", enabled = false },
  { "folke/tokyonight.nvim", enabled = false },

  -- Be careful with this one in LazyVim
  -- Disabling snacks.nvim may break LazyVim UI/features.
  -- Uncomment only after testing the rest first.
  -- { "folke/snacks.nvim", enabled = false },
}
