-- Configuração do estilo de listagem do netrw
vim.cmd('let g:netrw_liststyle = 3')

local opt = vim.opt

-- Configurações de Autosave
-- Observação: O autosave só funciona bem quando 'autowrite' e 'autowriteall' estão ativados juntos
-- opt.autowrite = true
-- opt.autowriteall = true

-- Configurações de Backup
-- opt.backup = true
-- opt.writebackup = true

-- Configurações de Indentação
-- Quebra de Indentação
opt.breakindent = true
-- opt.breakat = " ^I!@*-+;:,./?"

-- Tabs e Indentação
opt.tabstop = 2            -- 2 espaços para tabs
opt.shiftwidth = 2         -- Espaçamentos para a largura da indentação
opt.expandtab  = true      -- Expandir tab para espaços
opt.autoindent = true      -- Copiar a indentação da linha atual ao iniciar uma nova
opt.smartindent = true     -- Ajuda a manter a indentação automática do código

-- Backspace
opt.backspace = {'indent', 'eol', 'start'}  -- Permitir backspace em indentação, fim de linha ou início do modo de inserção

-- Números Relativos
opt.relativenumber = true
opt.number = true
opt.linebreak = true

-- Linha do Cursor
opt.cursorline = true  -- Destacar a linha atual do cursor

-- Aparência
-- Necessário usar iTerm2 ou outro terminal com suporte a cores reais
opt.termguicolors = true  -- Ativar termguicolors para o esquema de cores nightfly funcionar
opt.background = 'dark'   -- Esquema de cores pode ser claro ou escuro; serão feitos escuros

-- Configurações de Buffers
-- opt.bufhidden = "delete"

-- Ignore Case
opt.ignorecase = true
opt.smartcase = true
