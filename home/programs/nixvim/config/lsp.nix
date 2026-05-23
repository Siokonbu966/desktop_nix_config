{ ... }:

{
  extraConfigLua = ''
    local lsp = vim.lsp

    lsp.config("clangd", {})
    lsp.config("cssls", {})
    lsp.config("html", {})
    lsp.config("marksman", {})
    lsp.config("nil_ls", {})
    lsp.config("rnix", {
      cmd = { "rnix-lsp" },
      filetypes = { "nix" },
    })
    lsp.config("lua_ls", {
      settings = {
        Lua = {
          diagnostics = { globals = { "vim" } },
        },
      },
    })
    lsp.config("ts_ls", {
      settings = {
        workingDirectory = { mode = "auto" },
      },
    })

    lsp.enable({
      "clangd",
      "cssls",
      "html",
      "lua_ls",
      "marksman",
      "nil_ls",
      "tsserver",
      "rnix",
    })

    vim.diagnostic.config({
      virtual_text = true,
    })
  '';
}
