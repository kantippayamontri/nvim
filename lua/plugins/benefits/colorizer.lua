return {
    {
        -- this plugin use for see color in real-time
        "norcalli/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup()
        end,
    }
}
