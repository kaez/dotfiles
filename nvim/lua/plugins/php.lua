-- ~/.config/nvim/lua/plugins/php.lua
return {
  -- LSP
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.servers = opts.servers or {}
      opts.servers.intelephense = {
        settings = {
          intelephense = {
            stubs = {
              "apache",
              "bcmath",
              "bz2",
              "calendar",
              "com_dotnet",
              "Core",
              "ctype",
              "curl",
              "date",
              "dba",
              "dom",
              "enchant",
              "exif",
              "fileinfo",
              "filter",
              "fpm",
              "ftp",
              "gd",
              "hash",
              "iconv",
              "imap",
              "intl",
              "json",
              "ldap",
              "libxml",
              "mbstring",
              "mcrypt",
              "mysql",
              "mysqli",
              "oci8",
              "openssl",
              "pcntl",
              "pcre",
              "PDO",
              "pdo_mysql",
              "Phar",
              "readline",
              "recode",
              "Reflection",
              "session",
              "shmop",
              "SimpleXML",
              "snmp",
              "soap",
              "sockets",
              "sodium",
              "SPL",
              "sqlite3",
              "standard",
              "superglobals",
              "sysvmsg",
              "sysvsem",
              "sysvshm",
              "tidy",
              "tokenizer",
              "xml",
              "xmlreader",
              "xmlrpc",
              "xmlwriter",
              "xsl",
              "Zend OPcache",
              "zip",
              "zlib",
              "redis",
              "mongodb",
            },
            environment = {
              includePaths = {
                -- Add any project-specific include paths here
              },
            },
            files = {
              maxSize = 5000000,
            },
          },
        },
      }
    end,
  },

  -- Linting et formatting
  {
    "nvimtools/none-ls.nvim",
    opts = function(_, opts)
      local nls = require("null-ls")
      table.insert(
        opts.sources,
        nls.builtins.diagnostics.phpstan.with({
          extra_args = { "--memory-limit=2G" },
        })
      )
      table.insert(opts.sources, nls.builtins.formatting.pint)
      table.insert(opts.sources, nls.builtins.diagnostics.php) -- PHP built-in linter
    end,
  },

  -- Assurez-vous que Mason installe les outils nécessaires
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        "intelephense",
        "phpstan",
        "pint",
        "php-cs-fixer", -- Ajout de php-cs-fixer comme alternative à pint
      })
    end,
  },

  -- Configuration spécifique pour le formatting
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      opts.formatters_by_ft = opts.formatters_by_ft or {}
      opts.formatters_by_ft.php = { "pint", "php_cs_fixer" }
      return opts
    end,
  },

  -- Configuration spécifique pour le linting
  {
    "mfussenegger/nvim-lint",
    opts = function(_, opts)
      opts.linters_by_ft = opts.linters_by_ft or {}
      opts.linters_by_ft.php = { "phpstan", "php" }
      return opts
    end,
  },

  -- Ajout de TreeSitter pour une meilleure coloration syntaxique
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "php" })
      end
    end,
  },
}
