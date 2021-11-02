--Import Lua Unit
local luaUnit = require('./luaunit')
 
--Import index functions file
require('./index')

--Test Equal Strings
function testEqualStrings()
    local result = calculateDistanceHamming('1011001001', '1011001001')
    luaUnit.assertEquals(result, 0)
end

--Test Different Strings and Equal Length
function testDifferentStringsEqualLength()
    local result = calculateDistanceHamming('1011001001', '1001000011')
    luaUnit.assertEquals(result, 3)
end

--Test Different Strings and Different Length
function testDifferentStringsDifferentLength()
    local result = calculateDistanceHamming('1011001001', '10010000111')
    luaUnit.assertEquals(result, 4)
end

os.exit( luaUnit.LuaUnit.run() )