require("functions")
vim.opt.clipboard:append("unnamedplus")

if vim.g.neovide then
    vim.g.neovide_title_background_color = string.format(
        "%x",
        vim.api.nvim_get_hl(0, {id=vim.api.nvim_get_hl_id_by_name("Normal")}).bg
    )

    vim.g.neovide_title_text_color = "green"
end
