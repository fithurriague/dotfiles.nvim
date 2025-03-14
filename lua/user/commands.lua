vim.api.nvim_create_user_command(
  "OilToggle",
  function() vim.cmd((vim.bo.filetype == "oil") and "bd" or "Oil") end,
  { nargs = 0 }
)
