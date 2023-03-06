require("neodev").setup()

local settings = {
    mappings = {
        gd = 'lua require"telescope.builtin".lsp_definitions()',
        gi = 'lua require"telescope.builtin".lsp_implementations()',
        gr = 'lua require"telescope.builtin".lsp_references()',
    },
    servers = {
        eslint = {},
        pyright = {
            settings = {
            },
        },
        zk = {},
        jsonls = {},
        bashls = {},
        tsserver = {},
        dockerls = {},
        jsonnet_ls = {},
        gopls = {
            settings = {
                golsp = {
                    gofumpt = true,
                    staticcheck = true,
                    useplaceholders = true,
                    codelenses = {
                        gc_details = true,
                    },
                },
            },
        },
        clangd = {},
        lua_ls = {
            settings = {
                Lua = {
                    -- completion = {
                    --     callSnippet = "Replace",
                    -- },
                    -- format = {
                    --   enable = true,
                    -- }
                }
            }
        },
        ['rust_analyzer@nightly'] = {
            settings = {
                ['rust-analyzer'] = {
                    cargo = {
                        loadOutDirsFromCheck = true,
                    },
                    procMacro = {
                        enable = true,
                    },
                },
            },
        }
    },
}

require('lsp-setup').setup(settings)
require('lsp_lines').setup()

-- global config for diagnostic
vim.diagnostic.config({
    underline = true,
    virtual_text = false,
})

require('lsp_signature').setup()
require('lsp-colors').setup()

local border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' }
vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = border })
vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border })
