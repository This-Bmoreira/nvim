return {
  -- Especifica o plugin 'neovim/nvim-lspconfig'
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" }, -- Carrega o plugin nesses eventos
  dependencies = {
    "hrsh7th/cmp-nvim-lsp", -- Adiciona como dependência para autocompletar
    { "antosha417/nvim-lsp-file-operations", config = true }, -- Adiciona dependência com configuração automática
    { "folke/neodev.nvim", opts = {} }, -- Adiciona dependência com opções específicas
  },
  config = function()
    -- Importa o plugin lspconfig
    local lspconfig = require("lspconfig")

    -- Importa o plugin mason-lspconfig
    local mason_lspconfig = require("mason-lspconfig")

    -- Importa o plugin cmp-nvim-lsp
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    local keymap = vim.keymap -- Atalho para concisão

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        -- Mapeamentos locais ao buffer.
        -- Veja `:help vim.lsp.*` para documentação de qualquer uma das funções abaixo
        local opts = { buffer = ev.buf, silent = true }

        -- Define atalhos de teclas
        opts.desc = "Mostrar referências LSP"
        keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- mostra definição, referências

        opts.desc = "Ir para declaração"
        keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- vai para declaração

        opts.desc = "Mostrar definições LSP"
        keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- mostra definições LSP

        opts.desc = "Mostrar implementações LSP"
        keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- mostra implementações LSP

        opts.desc = "Mostrar definições de tipo LSP"
        keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- mostra definições de tipo LSP

        opts.desc = "Ver ações de código disponíveis"
        keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- ver ações de código disponíveis, no modo visual aplicará à seleção

        opts.desc = "Renomear inteligentemente"
        keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- renomear inteligentemente

        opts.desc = "Mostrar diagnósticos do buffer"
        keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- mostra diagnósticos do arquivo

        opts.desc = "Mostrar diagnósticos da linha"
        keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- mostra diagnósticos da linha

        opts.desc = "Ir para diagnóstico anterior"
        keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- vai para diagnóstico anterior no buffer

        opts.desc = "Ir para próximo diagnóstico"
        keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- vai para próximo diagnóstico no buffer

        opts.desc = "Mostrar documentação do que está sob o cursor"
        keymap.set("n", "K", vim.lsp.buf.hover, opts) -- mostra documentação do que está sob o cursor

        opts.desc = "Reiniciar LSP"
        keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapeamento para reiniciar LSP se necessário
      end,
    })

    -- Usado para habilitar autocompletar (atribuir a cada configuração de servidor LSP)
    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- Altera os símbolos de Diagnóstico na coluna de sinal (gutter)
    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    -- Configura handlers para servidores LSP instalados
    mason_lspconfig.setup_handlers({
      -- Handler padrão para servidores instalados
      function(server_name)
        lspconfig[server_name].setup({
          capabilities = capabilities,
        })
      end,
      ["emmet_ls"] = function()
        -- Configura servidor de linguagem Emmet
        lspconfig["emmet_ls"].setup({
          capabilities = capabilities,
          filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
        })
      end,
      ["lua_ls"] = function()
        -- Configura servidor Lua (com configurações especiais)
        lspconfig["lua_ls"].setup({
          capabilities = capabilities,
          settings = {
            Lua = {
              -- Faz o servidor de linguagem reconhecer a variável global "vim"
              diagnostics = {
                globals = { "vim" },
              },
              completion = {
                callSnippet = "Replace",
              },
            },
          },
        })
      end,
      ["pyright"] = function()
        -- Configura Pyright para Python
        lspconfig["pyright"].setup({
          capabilities = capabilities,
          settings = {
            python = {
              analysis = {
                typeCheckingMode = "strict",
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
              },
            },
          },
        })
      end,
      ["clangd"] = function()
        -- Configura clangd para C/C++
        lspconfig["clangd"].setup({
          capabilities = capabilities,
        })
      end,
    })
  end,
}
