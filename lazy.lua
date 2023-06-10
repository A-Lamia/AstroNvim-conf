local data = vim.fn.stdpath "data"

return {
  change_detection = {
    enabled = true,
    notify = false,
  },
  dev = {
    path = data .. "/dev",
    patterns = {},
  },
}
