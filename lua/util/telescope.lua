M = {}

M.actions = require "telescope.actions"
M.actions_state = require "telescope.actions.state"

local finders = require "telescope.finders"
local pickers = require "telescope.pickers"
local conf = require("telescope.config").values

function M.run_func_on_file(table, opts)
  opts = opts or {}

  local drop_down = require("telescope.themes").get_dropdown {}
  drop_down.attach_mappings = table.attach_mappings
  opts = vim.tbl_deep_extend("force", drop_down, opts)
  pickers
    .new(opts, {
      prompt_title = table.name,
      finder = finders.new_table {
        results = table.results(table.results_args),
        entry_maker = function(entry)
          return {
            value = entry,
            display = entry[1],
            ordinal = entry[1],
            path = entry[2],
          }
        end,
      },
      sorter = conf.file_sorter(opts),
    })
    :find()
end

return M
