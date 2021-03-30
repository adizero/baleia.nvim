local locations = require('baleia.locations') 
local styles = require('baleia.styles') 

local highlight = {}

local function single_line(name, location)
  return {
    firstcolumn = location.from.column,
    lastcolumn = location.to.column,
    line = location.from.line,
    name = name
  }
end

local function multi_line(line_starts_at, name, location)
  local highlights = {}

  table.insert(highlights, {
    firstcolumn = location.from.column,
    line = location.from.line,
    name = name
  })

  for line = location.from.line + 1, location.to.line - 1 do
    table.insert(highlights, {
      firstcolumn = line_starts_at,
      name = name,
      line = line
    })
  end

  table.insert(highlights, {
    firstcolumn = line_starts_at,
    lastcolumn = location.to.column,
    line = location.to.line,
    name = name
  })

  return highlights
end

function highlight.all(options, offset, lines)
  local locs = locations.extract(lines, styles.to_style)

  local definitions = {}
  local all_highlights = {}

  for _, loc in pairs(locs) do
    local location = locations.with_offset(offset, loc)
    local name = styles.name(options.name, location.style)

    if location.from.line == location.to.line then
      table.insert(all_highlights, single_line(name, location))
    else
      local highlights = multi_line(options.line_starts_at, name, location)
      for _, h in ipairs(highlights) do table.insert(all_highlights, h) end
    end

    table.insert(definitions, { 
      attributes = styles.attributes(location.style),
      name = name
    }) 
  end

  return { definitions = definitions, highlights = all_highlights }
end

return highlight