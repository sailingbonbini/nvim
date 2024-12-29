M = {}


local function log(msg)
    local log_file = vim.fn.stdpath("cache") .. "/pathetic.log"
    local file = io.open(log_file, "a")
    if file then
        file:write(msg .. "\n")
        file:close()
    end
end



M.config = {
  project_root_markers = {'.git/', 'pom.xml', '.project-root', 'init.lua'},
  content_root_markers = {'src/', '/src/main/java/'},
  -- TODO Should use the current user's home directory as stop dir
  stop_dir = vim.fn.expand("~"),
}

function M.setup (config)
  if config ~= nil then
    M.config = config
  end
end

function M.find_marker(path, root_markers, stop_dir)
  local search_path = path .. ';' .. stop_dir
  local found_dir = nil;
  
  for _, root_marker in ipairs(root_markers) do
    if string.match(root_marker, '$/') then
      -- do nothing: directory
      -- TODO: support directories as root markers
    else
      -- try to find the root marker, working up the directory tree
      local file = vim.fn.findfile(root_marker, search_path)
      if file ~= "" then
        local marker_file = vim.fn.fnamemodify(file, ":p")
        local marker_file_dir = vim.fn.fnamemodify(marker_file, ":h")
        found_dir = vim.fn.fnamemodify(marker_file_dir, ":p") -- make path absolute (add trailing "/")           
        break
      end
    end
  end

  return found_dir
end

--- Finds the relative path of given file to given root directory. 
-- Assumes that the file is located somewhere 
-- beneeth root_dir in the file system tree.
-- @param file  canonical path to the file 
-- @param root_dir "parent" part of the file path
-- @stopdir stop directory when recursively search up the file system tree
function M.path_relative_to(file, root_dir, stop_dir)
  file = file or vim.loop.fs_realpath(vim.fn.expand('%:p'))
  stop_dir = stop_dir or M.config.stop_dir
  root_dir = root_dir or M.find_marker(file, M.config.project_root_markers, stop_dir)
  
  if root_dir == nill or root_dir == "" then
    vim.notify("No root dir found for file " .. file, vim.log.levels.INFO)
  else
    from, to = string.find(file, root_dir)
    local relative_path = string.sub(file, to + 1)
    log("Working file path: " .. file)
    print("Found " .. relative_path .. " !!!")
  end
end


function M.test()
  M.path_relative_to()
end

return M
