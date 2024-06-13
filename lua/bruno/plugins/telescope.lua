return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        path_display = { "smart" },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous, -- mover para o resultado anterior
            ["<C-j>"] = actions.move_selection_next, -- mover para o próximo resultado
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- enviar selecionado para a lista rápida e abrir a lista rápida
          },
        },
      },
    })

    telescope.load_extension("fzf")

    -- definir mapeamentos de teclas
    local keymap = vim.keymap -- por concisão

    keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Buscar arquivos de forma imprecisa no diretório atual" })
    keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Buscar arquivos recentes de forma imprecisa" })
    keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Buscar string no diretório atual" })
    keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Buscar string sob o cursor no diretório atual" })
  end,
}
