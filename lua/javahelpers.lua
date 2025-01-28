local mini_completion = require('mini.completion')
local pathetic = require('pathetic')

local M = {}

function M.setup()

  vim.api.nvim_create_user_command("JH",
    function(opts)
      local args = vim.split(opts.args, " ")
      if #args < 2 then
        print ("Usage: JH [create|...] [class|interface|record]")
        return
      end
      local command = args[1]
      local subcommand = args[2]

      if command == "create" and subcommand == "class" then
        M.create_type(M.write_java_class)
      elseif command == "create" and subcommand == "interface" then
        M.create_type(M.write_java_interface)
      elseif command == "create" and subcommand == "record" then
        M.create_type(M.write_java_record)
      else
        print("Not yet implemented. command=" .. command .. ", subcommand=" ..subcommand)
        return
      end
    end,
    {
      nargs = "*",
      desc = "Java helpers"
    }
  )
end

-- get user input with a prompt
function M.get_user_input(prompt)
  local result = ""
  vim.ui.input({
    prompt = prompt .. ": "
  }, function(input)
    result = input
  end)
  return result
end

-- write the java class template to the provided file
function M.write_java_class(file)
  file:write("package " .. package_name .. ";\n\n")
  file:write("public class " .. class_name .. " {\n")
  file:write("    public " .. class_name .. "() {\n")
  file:write("        // Constructor\n")
  file:write("    }\n")
  file:write("}\n")
end

-- write the java interface template to the provided file
function M.write_java_interface(file)
  file:write("package " .. package_name .. ";\n\n")
  file:write("public interface " .. class_name .. " {\n")
  file:write("}\n")
end

-- write the java record template to the provided file
function M.write_java_record(file)
  file:write("package " .. package_name .. ";\n\n")
  file:write("public record " .. class_name .. "() {\n")
  file:write("}\n")
end

-- create a new java file relative to the provided directory
-- @param package_name   the FQN of the java package
-- @param class_name     the name of the class
-- @param dir            the project base dir 
-- @param template_fn    function that gets called with the file as parameter
function M.create_java_file(package_name, class_name, dir, template_fn)
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

  template_fn(file)

  -- Write a basic Java class template
  file:close()

  print("File created: " .. full_path)
  return full_path
end

function M.create_type(template_fn)
  -- get oackage name from user
  package_name = M.get_user_input("Package")

  -- Get class name from the user
  class_name = M.get_user_input("Class", nil)

  confirm = M.get_user_input(string.format("Generate %s.%s [Y/n]", package_name, class_name))

  if confirm == 'Y' then
    -- find the root dir and create the file
    root_dir = pathetic.get_java_source_root()
    if root_dir then
      full_path = M.create_java_file(package_name, class_name, root_dir, template_fn)
      if full_path then
        vim.cmd("edit " .. full_path)
        print("Created file: " .. full_path)
      end
    else
      print("Failed to determine the root directory.")
    end
  end
end



-- Run the main function
return M

