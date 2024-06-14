return {
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  build = "cd app && yarn install",
  init = function()
    vim.g.mkdp_filetypes = { "markdown" }
  end,
  ft = { "markdown" },
  config = function()
    -- definir mapeamentos de teclas
    local keymap = vim.keymap -- por concisão

    keymap.set("n", "<leader>mp", "<cmd>MarkdownPreview<CR>", { desc = "Iniciar o Markdown Preview" })
    keymap.set("n", "<leader>ms", "<cmd>MarkdownPreviewStop<CR>", { desc = "Parar o Markdown Preview" })
    keymap.set("n", "<leader>mt", "<cmd>MarkdownPreviewToggle<CR>", { desc = "Alternar o Markdown Preview" })
  end,
}


