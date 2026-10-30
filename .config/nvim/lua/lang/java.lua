require("treesitter").enable("java")

local metals_config = require("metals").bare_config()

metals_config.settings = {
    serverVersion = "2.0.0-M2",
    serverProperties = {
        "-Xmx4g",
        "-Djol.magicFieldOffset=true",
        "-Djol.tryWithSudo=true",
        "-Djdk.attach.allowAttachSelf",
        "--add-opens=java.base/java.nio=ALL-UNNAMED",
        "--add-exports=jdk.compiler/com.sun.tools.javac.api=ALL-UNNAMED",
        "--add-exports=jdk.compiler/com.sun.tools.javac.code=ALL-UNNAMED",
        "--add-exports=jdk.compiler/com.sun.tools.javac.comp=ALL-UNNAMED",
        "--add-exports=jdk.compiler/com.sun.tools.javac.file=ALL-UNNAMED",
        "--add-exports=jdk.compiler/com.sun.tools.javac.jvm=ALL-UNNAMED",
        "--add-exports=jdk.compiler/com.sun.tools.javac.main=ALL-UNNAMED",
        "--add-exports=jdk.compiler/com.sun.tools.javac.model=ALL-UNNAMED",
        "--add-exports=jdk.compiler/com.sun.tools.javac.parser=ALL-UNNAMED",
        "--add-exports=jdk.compiler/com.sun.tools.javac.processing=ALL-UNNAMED",
        "--add-exports=jdk.compiler/com.sun.tools.javac.resources=ALL-UNNAMED",
        "--add-exports=jdk.compiler/com.sun.tools.javac.tree=ALL-UNNAMED",
        "--add-exports=jdk.compiler/com.sun.tools.javac.util=ALL-UNNAMED",
        "--add-opens=java.base/sun.nio.ch=ALL-UNNAMED",
        "--add-opens=jdk.compiler/com.sun.tools.javac.code=ALL-UNNAMED",
        "--add-opens=jdk.compiler/com.sun.tools.javac.comp=ALL-UNNAMED",
        "--add-opens=jdk.compiler/com.sun.tools.javac.file=ALL-UNNAMED",
        "--add-opens=jdk.compiler/com.sun.tools.javac.parser=ALL-UNNAMED",
        "-XX:+DisplayVMOutputToStderr",
        "-Xlog:disable",
        "-Xlog:all=warning,gc=warning:stderr",
    },
}

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "java", "scala", "sbt" },
    group = vim.api.nvim_create_augroup("nvim-metals", { clear = true }),
    callback = function()
        require("metals").initialize_or_attach(metals_config)
    end,
})
