return {
  -- better diffing
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
    opts = {},
    keys = { { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "DiffView" } },
  },
  {
    "bennypowers/nvim-regexplainer",
    event = "BufRead",
    dependencies = { "nvim-treesitter/nvim-treesitter", "MunifTanjim/nui.nvim" },
    config = true,
  },
}
