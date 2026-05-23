{ ... }:

{
  plugins.oil = {
    enable = true;
    settings = {
      columns = [
        "icon"
      ];
      buf_options = {
        buflisted = false;
        bufhidden = "hide";
      };
      win_options = {
        wrap = false;
        signcolumn = "no";
        cursorcolumn = false;
        foldcolumn = "0";
        spell = false;
        list = false;
        conceallevel = 3;
        concealcursor = "nvic";
      };
      delete_to_trash = false;
      skip_confirm_for_simple_edits = false;
      prompt_save_on_select_new_entry = true;
      cleanup_delay_ms = 2000;
      lsp_file_methods = {
        enabled = true;
        timeout_ms = 1000;
        autosave_changes = false;
      };
      constrain_cursor = "editable";
      watch_for_changes = false;
      keymaps = {
        "g?" = { __unkeyed-1 = "actions.show_help"; mode = "n"; };
        "<CR>" = "actions.select";
        "<C-s>" = { __unkeyed-1 = "actions.select"; opts = { vertical = true; }; };
        "<C-h>" = { __unkeyed-1 = "actions.select"; opts = { horizontal = true; }; };
        "<C-t>" = { __unkeyed-1 = "actions.select"; opts = { tab = true; }; };
        "<C-p>" = "actions.preview";
        "<C-c>" = { __unkeyed-1 = "actions.close"; mode = "n"; };
        "<C-l>" = "actions.refresh";
        "-" = { __unkeyed-1 = "actions.parent"; mode = "n"; };
        "_" = { __unkeyed-1 = "actions.open_cwd"; mode = "n"; };
        "`" = { __unkeyed-1 = "actions.cd"; mode = "n"; };
        "g~" = { __unkeyed-1 = "actions.cd"; opts = { scope = "tab"; }; mode = "n"; };
        "gs" = { __unkeyed-1 = "actions.change_sort"; mode = "n"; };
        "gx" = "actions.open_external";
        "g." = { __unkeyed-1 = "actions.toggle_hidden"; mode = "n"; };
        "g\\" = { __unkeyed-1 = "actions.toggle_trash"; mode = "n"; };
      };
      use_default_keymaps = true;
      view_options = {
        show_hidden = true;
        is_hidden_file = {
          __raw = ''
            function(name, bufnr)
              local m = name:match("^%.")
              return m ~= nil
            end
          '';
        };
        is_always_hidden = {
          __raw = ''
            function(name, bufnr)
              return false
            end
          '';
        };
        natural_order = "fast";
        case_insensitive = false;
        sort = [
          [ "type" "asc" ]
          [ "name" "asc" ]
        ];
        highlight_filename = {
          __raw = ''
            function(entry, is_hidden, is_link_target, is_link_orphan)
              return nil
            end
          '';
        };
      };
      extra_scp_args = [ ];
      extra_s3_args = [ ];
      git = {
        add = { __raw = "function(path) return false end"; };
        mv = { __raw = "function(src_path, dest_path) return false end"; };
        rm = { __raw = "function(path) return false end"; };
      };
      float = {
        padding = 2;
        max_width = 0;
        max_height = 0;
        border = null;
        win_options = {
          winblend = 0;
        };
        get_win_title = null;
        preview_split = "auto";
        override = { __raw = "function(conf) return conf end"; };
      };
      preview_win = {
        update_on_cursor_moved = true;
        preview_method = "fast_scratch";
        disable_preview = { __raw = "function(filename) return false end"; };
        win_options = { };
      };
      confirmation = {
        max_width = 0.9;
        min_width = [ 40 0.4 ];
        width = null;
        max_height = 0.9;
        min_height = [ 5 0.1 ];
        height = null;
        border = null;
        win_options = {
          winblend = 0;
        };
      };
      progress = {
        max_width = 0.9;
        min_width = [ 40 0.4 ];
        width = null;
        max_height = [ 10 0.9 ];
        min_height = [ 5 0.1 ];
        height = null;
        border = null;
        minimized_border = "none";
        win_options = {
          winblend = 0;
        };
      };
      ssh = {
        border = null;
      };
      keymaps_help = {
        border = null;
      };
    };
  };
}
