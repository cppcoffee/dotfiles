return {
    'junnplus/lsp-setup.nvim',
    -- dir = '/Users/jun/Documents/workspace/nvim-lsp-setup',
    -- event = 'BufRead',
    dependencies = {
        'neovim/nvim-lspconfig',
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        'folke/neodev.nvim'
    },
    init = function()
        local rounded = { border = 'rounded' }
        vim.diagnostic.config({ float = rounded })
        local with_rounded = function(handler)
            return vim.lsp.with(handler, rounded)
        end
        vim.lsp.handlers['textDocument/hover'] = with_rounded(vim.lsp.handlers.hover)
        vim.lsp.handlers['textDocument/signatureHelp'] = with_rounded(vim.lsp.handlers.signature_help)
    end,
    opts = {
        mappings = {
            gd = function() require('telescope.builtin').lsp_definitions() end,
            gi = function() require('telescope.builtin').lsp_implementations() end,
            gr = function() require('telescope.builtin').lsp_references() end,
            ['<space>f'] = vim.lsp.buf.format,
        },
        servers = {
            eslint = {},
            pyright = {},
            yamlls = {
                settings = {
                    yaml = {
                        keyOrdering = false
                    }
                }
            },
            clangd = {},
            zk = {},
            jsonls = {},
            bashls = {},
            tsserver = {},
            clojure_lsp = {},
            dockerls = {},
            jsonnet_ls = {},
            helm_ls = {},
            zls = {
                settings = {
                    zls = {
                        enable_inlay_hints = true,
                        inlay_hints_show_builtin = true,
                        inlay_hints_exclude_single_argument = true,
                        inlay_hints_hide_redundant_param_names = true,
                        inlay_hints_hide_redundant_param_names_last_token = true,
                    }
                }
            },
            gopls = {
                settings = {
                    gopls = {
                        gofumpt = true,
                        -- staticcheck = true,
                        usePlaceholders = true,
                        codelenses = {
                            gc_details = true,
                        },
                        hints = {
                            rangeVariableTypes = true,
                            parameterNames = true,
                            constantValues = true,
                            assignVariableTypes = true,
                            compositeLiteralFields = true,
                            compositeLiteralTypes = true,
                            functionTypeParameters = true,
                        },
                    },
                },
            },
            bufls = {},
            html = {},
            lua_ls = {
                settings = {
                    Lua = {
                        workspace = {
                            checkThirdParty = false,
                        },
                    }
                }
            },
            ['rust_analyzer@nightly'] = {
                settings = {
                    ['rust-analyzer'] = {
                        diagnostics = {
                            disabled = { 'unresolved-proc-macro' },
                        },
                        cargo = {
                            loadOutDirsFromCheck = true,
                            buildScripts = {
                                enable = true,
                            },
                            --allFeatures = true,
                        },
                        procMacro = {
                            enable = true,
                        },
                        inlayHints = {
                            closureReturnTypeHints = {
                                enable = true
                            },
                        },
                        cache = {
                            warmup = false,
                        }
                    },
                },
            }
        }
    },
}
