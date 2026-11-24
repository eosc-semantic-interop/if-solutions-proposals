-- Auto-compute proportional column widths for Pandoc tables unless
-- the author explicitly supplied unequal column-width hints in Markdown.

local function max_unbroken_len(inlines_or_blocks)
  local txt = pandoc.utils.stringify(inlines_or_blocks)
  local max_tok = 0
  for tok in txt:gmatch("%S+") do
    -- Account for long CURIEs/URLs, slightly discounting breakable slashes
    local len = #tok
    if len > max_tok then
      max_tok = len
    end
  end
  return max_tok, #txt
end

local function has_explicit_unequal_widths(colspecs)
  local first_w = nil
  for _, spec in ipairs(colspecs) do
    local w = spec[2]
    if w == nil then
      return false
    end
    if first_w == nil then
      first_w = w
    elseif math.abs(w - first_w) > 0.02 then
      return true
    end
  end
  return false
end

function Table(tbl)
  local ncols = #tbl.colspecs
  if ncols <= 1 then
    return tbl
  end

  if has_explicit_unequal_widths(tbl.colspecs) then
    return tbl
  end

  local max_tok = {}
  local max_len = {}
  local sum_len = {}
  local nrows = 0

  for j = 1, ncols do
    max_tok[j] = 4
    max_len[j] = 4
    sum_len[j] = 0
  end

  local function scan_row(row)
    nrows = nrows + 1
    for j, cell in ipairs(row.cells) do
      if j <= ncols then
        local tok, len = max_unbroken_len(cell.contents)
        if tok > max_tok[j] then max_tok[j] = tok end
        if len > max_len[j] then max_len[j] = len end
        sum_len[j] = sum_len[j] + len
      end
    end
  end

  if tbl.head and tbl.head.rows then
    for _, row in ipairs(tbl.head.rows) do scan_row(row) end
  end
  for _, body in ipairs(tbl.bodies) do
    if body.head then
      for _, row in ipairs(body.head) do scan_row(row) end
    end
    if body.body then
      for _, row in ipairs(body.body) do scan_row(row) end
    end
  end
  if tbl.foot and tbl.foot.rows then
    for _, row in ipairs(tbl.foot.rows) do scan_row(row) end
  end

  if nrows == 0 then
    return tbl
  end

  -- Estimate minimum width needed for longest unbroken token (~0.0082 per char in footnotesize + padding)
  -- plus proportional weight based on sqrt of typical cell length
  local min_w = {}
  local weights = {}
  local total_min = 0
  local total_weight = 0

  for j = 1, ncols do
    local avg_len = sum_len[j] / nrows
    local eff_len = math.max(avg_len, max_len[j] * 0.75)
    local tok_need = math.min(0.28, math.max(0.09, max_tok[j] * 0.0085 + 0.035))
    min_w[j] = tok_need
    total_min = total_min + tok_need

    local w = math.sqrt(eff_len)
    weights[j] = w
    total_weight = total_weight + w
  end

  local new_widths = {}
  if total_min >= 0.95 then
    -- Normalize min_w directly if all columns are wide tokens
    for j = 1, ncols do
      new_widths[j] = min_w[j] / total_min
    end
  else
    -- Guarantee each column's token floor, distribute remaining space by sqrt(eff_len)
    local spare = 1.0 - total_min
    for j = 1, ncols do
      new_widths[j] = min_w[j] + spare * (weights[j] / total_weight)
    end
  end

  for j = 1, ncols do
    tbl.colspecs[j][2] = tonumber(string.format("%.4f", new_widths[j]))
  end

  return tbl
end
