
local mini_pick = require('mini.pick')

M ={}


-- Display a fuzzy picker for type definitions
M.pick_type_definitions = function()
    --local tags_file = "/Users/tom/projects/taco-cloud/tags" -- Adjust the path to your tags file
    --local items = M.parse_tags_file(tags_file) -- Parse the tags file

    items = { 
      {text='aaa', file="aaa.txt", path='/Users/tom/projects/taco-cloud/aaa.txt', lnum=15},
      {text='bbb', path='/Users/tom/bbb.txt', lnum=15},
    }

    cwd = '/Users/tom/projects/taco-cloud'

    mini_pick.start({
      source = { 
        items = items , 
        name = "Pick a type",
        cwd = cwd,
      }
    })
end


return M
