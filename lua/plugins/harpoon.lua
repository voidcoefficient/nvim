return {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    init = function()
      local harpoon = require "harpoon"
      local wk = require "which-key" -- for keybinds
      harpoon:setup() -- required
      harpoon:sync()

      -- telescope
      local conf = require("telescope.config").values
      local function toggle_telescope(harpoon_files)
        local make_finder = function()
          local file_paths = {}
          for _, item in ipairs(harpoon_files.items) do
            table.insert(file_paths, item.value)
          end

          return require("telescope.finders").new_table {
            results = file_paths,
          }
        end

        require("telescope.pickers")
          .new({}, {
            prompt_title = "Harpoon",
            finder = make_finder(),
            previewer = conf.file_previewer {},
            sorter = conf.generic_sorter {},
            attach_mappings = function(prompt_buffer_number, map)
              map("i", "<C-d>", function()
                local state = require "telescope.actions.state"
                local selected_entry = state.get_selected_entry()
                local current_picker = state.get_current_picker(prompt_buffer_number)

                table.remove(harpoon_files.items, selected_entry.index)
                current_picker:refresh(make_finder())
              end)

              return true
            end,
          })
          :find()
      end

      -- keybinds
      wk.add {
        { "<localleader>a", function() harpoon:list():add() end, desc = "add to harpoon", mode = "n" },
        { "<localleader>d", function() harpoon:list():remove() end, desc = "remove from harpoon", mode = "n" },
        { "<localleader>n", function() harpoon:list():next() end, desc = "next in harpoon list", mode = "n" },
        { "<localleader>p", function() harpoon:list():prev() end, desc = "prev in harpoon list", mode = "n" },
        { "<leader><leader>", function() toggle_telescope(harpoon:list()) end, desc = "list harpoon", mode = "n" },
      }
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },

  {
    "letieu/harpoon-lualine",
  },
}
