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

			vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
			vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
			vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
			vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
			vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, opts)
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

		require('mason-lspconfig').setup({
			ensure_installed = vim.tbl_keys(servers),
			automatic_installation = true,
		})

		local capabilities = vim.lsp.protocol.make_client_capabilities()

		local has_cmp_lsp, cmp_lsp = pcall(require, 'cmp_nvim_lsp')
		if has_cmp_lsp then
			capabilities = cmp_lsp.default_capabilities(capabilities)
		end

		local lspconfig = require('lspconfig')

		require('mason-lspconfig').setup_handlers {
			function(server_name)
				if servers[server_name] then
					local server_opts = servers[server_name] or {}
					server_opts.capabilities = capabilities

					-- 添加自动键位映射的回调
					server_opts.on_attach = function(client, bufnr)
						setup_mappings(client, bufnr)
					end

					lspconfig[server_name].setup(server_opts)
				end
			end
		}
	end
}
