local ok, _ = pcall(require, "impatient")
if not ok then
  return
end

local dk_modules = {
  "packer_compiled",
  "dk.options",
  "dk.colors",
  "dk.au",
  "dk.mappings",
  "dk.globals",
}

for i = 1, #dk_modules, 1 do
  local fine = pcall(require, dk_modules[i])
  if not fine then
    vim.notify(("This went wrong %s"):format(dk_modules[i]), vim.log.levels.ERROR, { timeout = 500 })
  end
end
