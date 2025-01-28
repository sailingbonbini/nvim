local vim = vim

-- Attach LSP to the buffer
local function on_attach(client, bufnr)
  vim.notify("Attached to buffer " .. bufnr)
end

-- Start the Lua language server manually
local function start_lua_lsp()
  vim.lsp.start({
    name = 'luals',
    cmd = {'lua-language-server'},
    root_dir = vim.fs.dirname(
      vim.fs.find({'init.lua', 'pom.xml'}, { upward = true })[1]
    ),
    settings = {
      Lua = {
        diagnostics = {
          globals = {
            'vim',
            'require',
          }
        }
      }
    }
  })
end

-- Ensure the Lua LSP starts when opening a Lua file
start_lua_lsp()
