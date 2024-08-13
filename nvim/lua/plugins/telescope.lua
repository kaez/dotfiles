-- Dans ~/.config/nvim/lua/plugins/telescope.lua

return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local builtin = require("telescope.builtin")

    telescope.setup({
      defaults = {
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
        },
        prompt_prefix = " > ",
        selection_caret = " > ",
        path_display = { "truncate" },
        file_ignore_patterns = { "node_modules" },
        mappings = {
          i = {
            ["<C-n>"] = actions.cycle_history_next,
            ["<C-p>"] = actions.cycle_history_prev,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
          },
        },
      },
      pickers = {
        find_files = {
          find_command = { "rg", "--files", "--hidden", "--glob", "!.git/*" },
        },
      },
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        },
      },
    })

    telescope.load_extension("fzf")

    -- Fonction personnalisée pour live_grep dans le répertoire courant
    local function grep_current_dir()
      builtin.live_grep({ cwd = vim.fn.expand("%:p:h") })
    end

    -- Définir un raccourci clavier pour cette fonction
    vim.keymap.set("n", "<leader>fg", grep_current_dir, { desc = "Live Grep (Current Dir)" })

    -- Vous pouvez également garder le live_grep original si vous le souhaitez
    vim.keymap.set("n", "<leader>fG", builtin.live_grep, { desc = "Live Grep (Project)" })
  end,
}
