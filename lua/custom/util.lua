---Because most plugins are hosted on GitHub, you can use this helper
---to have less repetition in the plugin modules.
---@param repo string
---@return string
local function gh(repo) return 'https://github.com/' .. repo end

return { gh = gh }
