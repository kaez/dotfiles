return {
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        php = { "php", "phpcs", "phpstan" },
      },
      linters = {
        phpcs = {
          args = { "--standard=PSR12" },
        },
        phpstan = {
          args = { "analyze", "--error-format", "raw", "--no-progress" },
        },
      },
    },
  },
}
