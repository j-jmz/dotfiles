local wk = require("which-key")
wk.register({
  f = {
    name = "Files", -- group name
  },
  g = {
    name = "Git", -- group name
  },
}, { prefix = "<leader>" })
