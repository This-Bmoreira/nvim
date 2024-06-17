return {
  -- Especifica o plugin 'hrsh7th/nvim-cmp'
  "hrsh7th/nvim-cmp",
  event = "InsertEnter", -- Carrega o plugin no evento InsertEnter
  dependencies = {
    "hrsh7th/cmp-path", -- Fonte para caminhos do sistema de arquivos
  },
  config = function()
    -- Importa o plugin nvim-cmp
    local cmp = require("cmp")

    -- Configura o nvim-cmp
    cmp.setup({
      completion = {
        completeopt = "menu,menuone,preview,noselect", -- Configurações de completamento
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-k>"] = cmp.mapping.select_prev_item(), -- Seleciona a sugestão anterior
        ["<C-j>"] = cmp.mapping.select_next_item(), -- Seleciona a próxima sugestão
        ["<CR>"] = cmp.mapping.confirm({ select = false }), -- Confirma a sugestão selecionada
      }),
      -- Fontes para autocompletar
      sources = cmp.config.sources({
	-- { name = "nvim_lsp"},
        { name = "path" }, -- Caminhos do sistema de arquivos
      }),
    })
  end,
}
