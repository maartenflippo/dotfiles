vim.filetype.add({
    extension = {
        mzn = "minizinc",
        fzn = "minizinc",
        dzn = "datazinc",
    },
})

local treesitter = require("treesitter")

treesitter.enable("minizinc")
treesitter.enable("datazinc")
