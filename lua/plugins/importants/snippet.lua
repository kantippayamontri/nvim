return {
  {
    "L3MON4D3/LuaSnip",
    dependencies = { "rafamadriz/friendly-snippets" }, -- ensure to use friendly-snippets -> can delete this line if you want to use your own snippets
    -- follow latest release.
    version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    build = "make install_jsregexp",
    config = function(_, opts)
        -- this config from https://github.com/rafamadriz/friendly-snippets/wiki
      if opts then
        require("luasnip").config.setup(opts)
      end
      vim.tbl_map(function(type)
        require("luasnip.loaders.from_" .. type).lazy_load()
      end, { "vscode", "snipmate", "lua" })
      -- friendly-snippets - enable standardized comments snippets
      require("luasnip").filetype_extend("typescript", { "tsdoc" })
      require("luasnip").filetype_extend("javascript", { "jsdoc" })
      require("luasnip").filetype_extend("lua", { "luadoc" })
      require("luasnip").filetype_extend("python", { "pydoc" })
      require("luasnip").filetype_extend("java", { "javadoc" })
      require("luasnip").filetype_extend("sh", { "shelldoc" })
    end,
  },
  {
    "https://github.com/rafamadriz/friendly-snippets",
    config = function() end,
  },
}
