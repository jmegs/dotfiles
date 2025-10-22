local format = require("utils.format")

return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = (function()
        local formatters = {
          lua = { "stylua" },
        }

        for _, ft in ipairs(format.filetypes_with_dynamic_formatter) do
          ---@diagnostic disable-next-line: assign-type-mismatch
          formatters[ft] = format.biome_or_prettier
        end

        return formatters
      end)(),
    },
  },
}
