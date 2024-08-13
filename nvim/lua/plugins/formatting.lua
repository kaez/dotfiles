return {
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      opts.formatters_by_ft = opts.formatters_by_ft or {}
      opts.formatters_by_ft.php = { "pint" }

      opts.formatters = opts.formatters or {}
      opts.formatters.pint = {
        command = "pint",
        args = { "-v" },
      }
    end,
  },
}
