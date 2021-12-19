local colors = {}

colors.main = {

  bg = "#191724",
  fg = "#e0def4",
  black = "#6e6a86",
  red = "#eb6f92",
  green = "#9ccfd8",
  yellow = "#f6c177",
  blue = "#31748f",
  magenta = "#c4a7e7",
  cyan = "#ebbcba",
  white = "#e0def4",
  cursor = "#796268",
}

colors.normal = {
  colors.main.black,
  colors.main.red,
  colors.main.green,
  colors.main.yellow,
  colors.main.blue,
  colors.main.magenta,
  colors.main.cyan,
  colors.main.white,
}

colors.bright = {
  colors.main.black,
  colors.main.red,
  colors.main.green,
  colors.main.yellow,
  colors.main.blue,
  colors.main.magenta,
  colors.main.cyan,
  colors.main.white,
}

return colors
