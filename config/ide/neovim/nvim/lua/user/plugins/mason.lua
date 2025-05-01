return {
  -- use mason-tool-installer for automatically installing Mason packages
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    -- overrides `require("mason-tool-installer").setup(...)`
    opts = {
      -- Make sure to use the names found in `:Mason`
      ensure_installed = {
        -- install language servers
        "lua-language-server",
        "dcm",
        "gopls",
        "jdtls",
        "json-lsp",
        "kotlin-language-server",
        "lua-language-server",
        "pbls",
        "pyright",
        "rust-analyzer",
        "terraform-ls",
        "yaml-language-server",
        "zls",

        -- install linters
        "golangci-lint",
        "staticcheck", -- Delve is a debugger
        "ktlint",
        "checkstyle",
        "sonarlint-language-server", -- Javadbg is a debugger
        "bacon", -- codelldb is a debugger
        "pylint",
        "flake8",
        "tflint",
        "jsonlint",
        "yamllint",
        "buf", -- Protobuf

        -- install formatters

        -- install debuggers
        "debugpy",
        "codelldb",
        "dart-debug-adapter",
        "debugpy",
        "delve",
        "java-debug-adapter",
        "kotlin-debug-adapter",

        -- install any other package
        "tree-sitter-cli",
      },
    },
  },
}
