return {
  -- Especifica o plugin 'williamboman/mason.nvim'
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim", -- Adiciona como dependência
  },
  config = function()
    -- Importa o plugin mason
    local mason = require("mason")

    -- Importa o plugin mason-lspconfig
    local mason_lspconfig = require("mason-lspconfig")

    -- Habilita o mason e configura ícones
    mason.setup({
      ui = {
        icons = {
          package_installed = "✓", -- Ícone para pacotes instalados
          package_pending = "➜", -- Ícone para pacotes pendentes
          package_uninstalled = "✗", -- Ícone para pacotes não instalados
        },
      },
    })

    -- Configurações do mason-lspconfig
    mason_lspconfig.setup({
      -- Lista de servidores que o mason deve instalar
      ensure_installed = {
        "tsserver",      -- Servidor para TypeScript
        "html",          -- Servidor para HTML
        "cssls",         -- Servidor para CSS
        "tailwindcss",   -- Servidor para Tailwind CSS
        "lua_ls",        -- Servidor para Lua
        "emmet_ls",      -- Servidor para Emmet
        "prismals",      -- Servidor para Prisma
        "pyright",       -- Servidor para Python
        "clangd",        -- Servidor para C/C++
      },
    })
  end,
}
