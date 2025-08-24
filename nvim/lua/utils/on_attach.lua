local M = {}

-- LSP settings.
-- This function gets run when an LSP connects to a particular buffer.
function M.on_attach(client, bufnr, forceAutoformat)
  if forceAutoformat == nil then forceAutoformat = false end

  -- Convenience method to easily define LSP related key mappings.
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end
    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  -- Rename
  nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')

  -- Code actions
  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

  -- Go to definition
  nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')

  -- Go to type definition
  nmap('gt', vim.lsp.buf.type_definition, '[G]oto [T]ype Definition')

  -- Go to references
  nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')

  -- Go to implementation
  nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')

  -- Show documentation for the element under the cursor
  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')

  -- Rename a variable
  nmap("<leader>rn", vim.lsp.buf.rename, '[R]e[n]ame')

  -- Restart the LSP server
  nmap("<leader>rs", ":LspRestart<CR>", '[R]e[s]tart LSP')

  -- Create a `:Format` command local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })

  -- Autoformat when saving
  -- Add to disable formatting for tsserver: and client.name ~= "tsserver"
  if (forceAutoformat or client:supports_method("textDocument/formatting")) then
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format({ bufnr = bufnr })
      end,
    })
  end
end

return M
