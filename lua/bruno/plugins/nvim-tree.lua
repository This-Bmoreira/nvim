return {
  "nvim-tree/nvim-tree.lua",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    local nvimtree = require("nvim-tree")

    -- configurações recomendadas pela documentação do nvim-tree
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    nvimtree.setup({
      view = {
        width = 35,
        relativenumber = true,
      },
      -- alterar ícones de setas de pastas
      renderer = {
        indent_markers = {
          enable = true,
        },
        icons = {
          glyphs = {
            folder = {
              arrow_closed = "", -- seta quando a pasta está fechada
              arrow_open = "", -- seta quando a pasta está aberta
            },
          },
        },
      },
      -- desativar window_picker para
      -- o explorador funcionar bem com
      -- divisões de janela
      actions = {
        open_file = {
          window_picker = {
            enable = false,
          },
        },
      },
      filters = {
	dotfiles = true,
        custom = { ".DS_Store", ".gitignore" },
      },
      git = {
        ignore = false,
      },
    })

    -- definir mapas de teclas
    local keymap = vim.keymap -- para concisão

    keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Alternar explorador de arquivos" }) -- alternar explorador de arquivos
    keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Alternar explorador de arquivos no arquivo atual" }) -- alternar explorador de arquivos no arquivo atual
    keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Recolher explorador de arquivos" }) -- recolher explorador de arquivos
    keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Atualizar explorador de arquivos" }) -- atualizar explorador de arquivos
  end
}
