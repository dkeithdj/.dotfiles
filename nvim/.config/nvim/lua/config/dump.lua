local colors = {
  none       = "NONE",
  bg         = "#32302f",

  fg    = "#d4be98",
  fg_gutter  = "#3b4261",

  black      = "#393b44",
  red        = "#c94f6d",
  green      = "#81b29a",
  yellow     = "#dbc074",
  blue = "#7daea3",
  magenta    = "#9d79d6",
  cyan       = "#63cdcf",
  white      = "#dfdfe0",
  orange     = "#f4a261",
  pink       = "#d67ad2",

  black_br   = "#475072",
  red_br     = "#d6616b",
  green_br   = "#58cd8b",
  yellow_br  = "#ffe37e",
  blue_br    = "#84cee4",
  magenta_br = "#b8a1e3",
  cyan_br    = "#59f0ff",
  white_br   = "#f2f2f2",
  orange_br  = "#f6a878",
  pink_br    = "#df97db",

  -- -15 brightness -15 saturation
  black_dm   = "#32343b",
  red_dm     = "#ad425c",
  green_dm   = "#689c83",
  yellow_dm  = "#c7a957",
  blue_dm    = "#5483c1",
  magenta_dm = "#835dc1",
  cyan_dm    = "#4ab8ba",
  white_dm   = "#bdbdc0",
  orange_dm  = "#e28940",
  pink_dm    = "#c15dbc",

  comment    = "#526175",

  git = {
    add      = "#70a288",
    change   = "#a58155",
    delete   = "#904a6a",
    conflict = "#c07a6d",
  },

  gitSigns = {
    add    = "#164846",
    change = "#394b70",
    delete = "#823c41",
  }
}
local util = {}
function util.hex_to_rgb(hex_str)
  local hex = "[abcdef0-9][abcdef0-9]"
  local pat = "^#(" .. hex .. ")(" .. hex .. ")(" .. hex .. ")$"
  hex_str = string.lower(hex_str)

  assert(string.find(hex_str, pat) ~= nil, "hex_to_rgb: invalid hex_str: " .. tostring(hex_str))

  local r, g, b = string.match(hex_str, pat)
  return { tonumber(r, 16), tonumber(g, 16), tonumber(b, 16) }
end

function util.hex_to_norm_rgb(hex_str)
  local c = util.hex_to_rgb(hex_str)
  return { c[1] / 255, c[2] / 255, c[3] / 255 }
end

---@param fg string foreground color
---@param bg string background color
---@param alpha number number between 0 and 1. 0 results in bg, 1 results in fg
function util.blend(fg, bg, alpha)
  bg = util.hex_to_rgb(bg)
  fg = util.hex_to_rgb(fg)

  local blendChannel = function(i)
    local ret = (alpha * fg[i] + ((1 - alpha) * bg[i]))
    return math.floor(math.min(math.max(0, ret), 255) + 0.5)
  end

  return string.format("#%02X%02X%02X", blendChannel(1), blendChannel(2), blendChannel(3))
end

function util.darken(hex, amount, bg)
  return util.blend(hex, bg or util.bg, math.abs(amount))
end
