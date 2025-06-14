return
{
    'neovim/nvim-lspconfig',
    event = 'BufReadPre',
    dependencies = {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        'folke/lazydev.nvim',
        'nvim-telescope/telescope.nvim',
    },
    config = function()
        require('mason').setup({
            ui = {
                border = 'rounded',
            }
        })

        vim.lsp.set_log_level('error')

        local rounded = { border = 'rounded' }
        vim.diagnostic.config({ float = rounded })

        local with_rounded = function(handler)
            return vim.lsp.with(handler, rounded)
        end

        vim.lsp.handlers['textDocument/hover'] = with_rounded(vim.lsp.handlers.hover)
        vim.lsp.handlers['textDocument/signatureHelp'] = with_rounded(vim.lsp.handlers.signature_help)

        local function setup_mappings(client, bufnr)
            local opts = { noremap = true, silent = true, buffer = bufnr }

            vim.keymap.set('n', 'gd', function() require('telescope.builtin').lsp_definitions() end, opts)
            vim.keymap.set('n', 'gi', function() require('telescope.builtin').lsp_implementations() end, opts)
            vim.keymap.set('n', 'gr', function() require('telescope.builtin').lsp_references() end, opts)
            vim.keymap.set('n', 'gt', function() require('telescope.builtin').lsp_type_definitions() end, opts)
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
            vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
            vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
            vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)

            -- diagnostic
            vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
            vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
            vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, opts)
            vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)

            -- format
            vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format { async = true } end, opts)

            if client.server_capabilities.documentFormattingProvider then
                vim.api.nvim_create_autocmd("BufWritePre", {
                    group = vim.api.nvim_create_augroup("LspFormatting", {}),
                    buffer = bufnr,
                    callback = function()
                        vim.lsp.buf.format({ bufnr = bufnr })
                    end,
                })
            end
        end

        local servers = {
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
            jsonls = {},
            bashls = {},
            dockerls = {},
            gopls = {
                settings = {
                    gopls = {
                        gofumpt = true,
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
            lua_ls = {
                settings = {
                    Lua = {
                        workspace = {
                            checkThirdParty = false,
                        },
                    }
                }
            },
            rust_analyzer = {
                settings = {
                    diagnostics = {
                        disabled = { 'unresolved-proc-macro' },
                    },
                    cargo = {
                        loadOutDirsFromCheck = true,
                        buildScripts = {
                            enable = true,
                        },
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

        --[[
        require('mason-lspconfig').setup({
            ensure_installed = vim.tbl_keys(servers),
            automatic_installation = true,
        })
        ]]--

        local has_cmp_lsp, cmp_lsp = pcall(require, 'cmp_nvim_lsp')
        if has_cmp_lsp then
            capabilities = cmp_lsp.default_capabilities(capabilities)
        end

        local lspconfig = require('lspconfig')
        for server_name, server_opts in pairs(servers) do
            local opts = vim.tbl_deep_extend("force", {
                capabilities = capabilities,
                on_attach = setup_mappings,
            }, server_opts)

            lspconfig[server_name].setup(opts)
        end
    end
}
