
-- Import lualine plugin safely
local status, lualine = pcall(require, "lualine")
if not status then
  return
end

-- Get lualine nightfly theme
local lualine_nightfly = require("lualine.themes.nightfly")

-- New colors for theme
local new_colors = {
  blue = "#65D1FF",
  green = "#3EFFDC",
  violet = "#FF61EF",
  yellow = "#FFDA7B",
  black = "#000000",
}

-- Change nightfly theme colors
lualine_nightfly.normal.a.bg = new_colors.blue
lualine_nightfly.insert.a.bg = new_colors.green
lualine_nightfly.visual.a.bg = new_colors.violet
lualine_nightfly.command = {
  a = {
    gui = "bold",
    bg = new_colors.yellow,
    fg = new_colors.black, -- black
  },
}

-- Configure lualine with modified theme and ensure 'mode' is included
lualine.setup({
  options = {
    theme = lualine_nightfly,
  },
  sections = {
    lualine_a = {"mode"}, -- Add mode to lualine_a
    lualine_b = {"branch", "diff", "diagnostics"},
    lualine_c = {"filename"},
    lualine_x = {"encoding", "fileformat", "filetype"},
    lualine_y = {"progress"},
    lualine_z = {"location"},
  },
})
