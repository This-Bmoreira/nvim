-- Configuração do estilo de listagem do netrw
vim.cmd('let g:netrw_liststyle = 3')

local opt = vim.opt

-- Observação: O autosave só funciona bem quando 'autowrite' e 'autowriteall' estão ativados juntos
-- opt.autowrite = true
-- opt.autowriteall = true

-- Configurações de backup
-- opt.backup = true
-- opt.writebackup = true

-- Indentação
opt.breakindent = true
-- opt.breakat = " ^I!@*-+;:,./?"

-- Backspace
opt.backspace = {'indent', 'eol', 'start'}  -- Permitir backspace em indentação, fim de linha ou início do modo de inserção

-- Números relativos
opt.relativenumber = true
opt.number = true
opt.linebreak = true

-- Linha do cursor
opt.cursorline = true -- Destacar a linha atual do cursor

-- Aparência
-- (Necessário usar iterm2 ou outro terminal com suporte a cores reais)
opt.termguicolors = true -- Ativar termguicolors para o esquema de cores nightfly funcionar
opt.background = 'dark'  -- Esquema de cores pode ser claro ou escuro; serão feitos escuros

-- Buffers
-- opt.bufhidden = "delete"

-- ignore case
opt.ignorecase = true
opt.smartcase = true
