{ ... }:

{
  plugins.tiny-inline-diagnostic = {
    enable = true;
  };

  # Disable default virtual text as recommended by the plugin
  extraConfigLua = ''
    vim.diagnostic.config({ virtual_text = false })
  '';
}
