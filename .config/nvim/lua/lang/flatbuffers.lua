vim.filetype.add({
    extension = {
        fbs = "flatbuffers",
    },
})

require("treesitter").enable("flatbuffers")
