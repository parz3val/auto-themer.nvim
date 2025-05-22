# auto-theme.nvim

A Neovim plugin that automatically sets the `background` option (light or dark) based on your system's theme.



## Installation

This plugin can be installed using a Neovim package manager like [Lazy.nvim](https://github.com/folke/lazy.nvim).

Add the following to your `plugins` specification in your Lazy.nvim configuration:

```lua
return {
  -- ... other plugins ...
  {
    "parz3val/auto-themer.nvim",
    config = function()
      require("auto-themer").setup({})
    end,
  },
}
```

## Usage
The plugin will be automatically enabled after installation.

To manually enable the plugin, call the `setup` function:

```lua
require("auto_theme").setup({})
```

The `setup` function takes a single argument, which is a table of options.

## TODO
[x] Test on macos
[ ] Test on windows
[] Test on linux
