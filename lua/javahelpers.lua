local mini_completion = require('mini.completion')
local pathetic = require('pathetic')

local M = {}

function M.get_user_input(prompt)
  local result = ""
  vim.ui.input({
    prompt = prompt .. ": "
  }, function(input)
    result = input
  end)
  return result
end


function M.create_java_file(package_name, class_name, dir)
  -- Convert package name to a path
  local package_path = package_name:gsub('%.', '/')
  local full_path = dir .. "/" .. package_path .. "/" .. class_name .. ".java"

  -- Ensure directories exist
  local parent_dir = vim.fn.fnamemodify(full_path, ":h")
  vim.fn.mkdir(parent_dir, "p")

  -- Create and write to the Java file
  local file = io.open(full_path, "w")
  if not file then
    print("Failed to create file: " .. full_path)
    return nil
  end

  -- Write a basic Java class template
  file:write("package " .. package_name .. ";\n\n")
  file:write("public class " .. class_name .. " {\n")
  file:write("    public " .. class_name .. "() {\n")
  file:write("        // Constructor\n")
  file:write("    }\n")
  file:write("}\n")
  file:close()

  print("File created: " .. full_path)
  return full_path
end

M.CreateClass = function()
  -- get oackage name from user
  package_name = M.get_user_input("Package")

  -- Get class name from the user
  class_name = M.get_user_input("Class", nil)

  confirm = M.get_user_input(string.format("Generate %s.%s [Y/n]", package_name, class_name))

  if confirm == 'Y' then
    -- find the root dir and create the file
    root_dir = pathetic.get_java_source_root()
    if root_dir then
      full_path = M.create_java_file(package_name, class_name, root_dir)
      if full_path then
        vim.cmd("edit " .. full_path)
        print("Created file: " .. full_path)
      end
    else
      print("Failed to determine the root directory.")
    end
    -- project_root = pathetic.path_relative_to()
    -- print(project_root)
  end
end

-- Run the main function
return M

