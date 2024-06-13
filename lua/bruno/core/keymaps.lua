-- definir a tecla líder para espaço
vim.g.mapleader = " "

local keymap = vim.keymap -- para concisão

---------------------
-- Mapas de Teclas Gerais -------------------


-- limpar destaques de pesquisa
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Limpar destaques de pesquisa" })
