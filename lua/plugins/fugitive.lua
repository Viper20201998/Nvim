return  {
  "tpope/vim-fugitive",
  cmd = {"G", "Git"},
  keys = {
    {"<leader>ga", ":Git fetch --all -p<cr>", desc = "Git Fetch"},
    {"<leader>gl", ":Git pull<cr>", desc = "Git Pull"},
  },

}
