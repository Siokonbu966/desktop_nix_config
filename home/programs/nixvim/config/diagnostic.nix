{ ... }:

{
  opts.updatetime = 300;
  autoCmd = [
    {
      event = [ "CursorHold" ];
      callback.__raw = ''
        function()
          vim.diagnostic.open_float(nil, {
            focusable = false,
            close_events = {
              "BufLeave",
              "CursorMoved",
              "InsertEnter",
              "FocusLost",
            },
            border = "rounded",
            source = "if_many",
            prefix = " ",
            scope = "cursor",
          })
        end
      '';
    }
    {
      event = [ "CursorHold" ];
      callback.__raw = ''
        function()
          vim.lsp.buf.hover({
            border = "rounded",
            focusable = false,
          })
        end
      '';
    }
  ];
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
