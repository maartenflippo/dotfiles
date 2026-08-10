-- Coqtail is installed with a no-op `load` in pack.lua, so load it only
-- when actually editing a Coq file. This avoids Coqtail's startup probe of
-- the python3 provider, which errors if Coq/pynvim aren't installed.
vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup("my.lang.coq", { clear = true }),
    pattern = "coq",
    once = true,
    callback = function()
        local ok, err = pcall(vim.cmd.packadd, "coqtail")
        if not ok then
            vim.notify(
                "Coqtail failed to load (is pynvim installed? `pip install pynvim`):\n" .. err,
                vim.log.levels.WARN
            )
            return
        end
        -- Re-fire FileType so Coqtail's own ftplugin/syntax files (which
        -- weren't on the runtimepath yet) get applied to this buffer.
        vim.api.nvim_exec_autocmds("FileType", { pattern = "coq" })
    end,
})
