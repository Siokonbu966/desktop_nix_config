{ ... }:

{
  extraConfigLua = ''
    vim.diagnostic.handlers["my/notify"] = {
      show = function(namespace, bufnr, diagnostics, opts)
        local level = opts["my/notify"].log_level
        local name = vim.diagnostic.get_namespace(namespace).name
        local msg = string.format("%d diagnostics in buffer %d from %s", #diagnostics, bufnr, name)
        vim.notify(msg, level)
      end,
    }

    vim.diagnostic.config({
      ["my/notify"] = {
        log_level = vim.log.levels.INFO,
        severity = vim.diagnostic.severity.ERROR,
        virtual_text = true,
      },
    })

    vim.keymap.set("n", "gK", function()
      local new_config = not vim.diagnostic.config().virtual_lines
      vim.diagnostic.config({ virtual_lines = new_config })
    end, { desc = "Toggle diagnostic virtual_lines" })
  '';
}
