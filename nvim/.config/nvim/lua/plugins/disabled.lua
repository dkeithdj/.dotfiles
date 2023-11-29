return {
  -- { "lukas-reineke/indent-blankline.nvim", enabled = true },
  {
    "echasnovski/mini.indentscope",
    enabled = true,

    config = function()
      require("mini.indentscope").gen_animation.none()
    end,
  },
}
