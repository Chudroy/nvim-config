return {
  -- Use selimacerbas/markdown-preview.nvim instead (pure Lua, actively maintained)
  {
    "selimacerbas/markdown-preview.nvim",
    dependencies = { "selimacerbas/live-server.nvim" },
    cmd = { "MarkdownPreview", "MarkdownPreviewStop", "MarkdownPreviewRefresh" },
    ft = { "markdown" },
    keys = {
      {
        "<leader>cp",
        ft = "markdown",
        "<cmd>MarkdownPreview<cr>",
        desc = "Markdown Preview",
      },
    },
    config = function()
      require("markdown_preview").setup({
        -- Keep previews private to this machine and do not execute embedded HTML.
        host = "127.0.0.1",
        allow_raw_html = false,
      })
    end,
  },
}
