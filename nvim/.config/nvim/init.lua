pcall(require, "impatient")

local dk_modules = {
  "packer_compiled",
  "dk.options",
  "dk.mappings",
}

for i = 1, #dk_modules, 1 do
  local fine = pcall(require, dk_modules[i])
  if not fine then
    vim.notify(("This went wrong %s"):format(dk_modules[i]), vim.log.levels.ERROR, { timeout = 500 })
  end
end

vim.defer_fn(function()
  require("dk.plugins")
end, 0)
