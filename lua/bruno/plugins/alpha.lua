return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    -- Definir cabeçalho
    dashboard.section.header.val = {
      "                                                     ",
      "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
      "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
      "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
      "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
      "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
      "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
      "                                                     ",
    }

    -- Definir menu
    dashboard.section.buttons.val = {
      dashboard.button("e", "  > Novo Arquivo", "<cmd>ene<CR>"),
      dashboard.button("SPC ee", "  > Alternar explorador de arquivos", "<cmd>NvimTreeToggle<CR>"),
      dashboard.button("SPC ff", "󰱼 > Buscar Arquivo", "<cmd>Telescope find_files<CR>"),
      dashboard.button("SPC fs", "  > Buscar Palavra", "<cmd>Telescope live_grep<CR>"),
      dashboard.button("q", " > Sair do NVIM", "<cmd>qa<CR>"),
    }

    -- Enviar configuração para alpha
    alpha.setup(dashboard.opts)

    -- Desativar folding no buffer do alpha
    vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
  end,
}

