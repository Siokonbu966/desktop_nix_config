{...}:
{
  programs.opencode = {
    enable = true;
    settings = {
      permission = {
        websearch = "allow";
      };
      mcp = {
        context7 = {
          type = "remote";
          url = "https://mcp.context7.com/mcp";
          enabled = true;
        };
      };
    };
  };
}
