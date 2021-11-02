--Import Lua Unit
local luaUnit = require('./luaunit')
 
--Import index functions file
require('./index')

-- Test Create New Robot
function testCreateRobot()
    local robot = Robot:new()
    luaUnit.assertEquals(robot:getName(), nil)
end

-- Test Start Robot
function testStartRobot()
    local robot = Robot:new()
    robot:start()
    local robotName = robot:getName()
    luaUnit.assertNotNil(robotName)
    local pattern = '[A-Z][A-Z][0-9][0-9][0-9]'
    luaUnit.assertStrMatches(robotName, pattern)
end

-- Test Reset Robot
function testResetRobot()
    local robot = Robot:new()
    robot:start()
    local robotName = robot:getName()
    robot:reset()
    local newRobotName = robot:getName()
    luaUnit.assertNotEquals(robotName, newRobotName)
    local pattern = '[A-Z][A-Z][0-9][0-9][0-9]'
    luaUnit.assertStrMatches(newRobotName, pattern)
end

-- Test example of usage
function testExampleOfUsage()
    local robotOne = Robot:new()
    robotOne:start()

    local robotTwo = Robot:new()
    robotTwo:start()

    robotTwo:reset()

    local robotThree = Robot:new()
    robotThree:start()

    local tableExpectedNames = robotOne:getName() .. "," .. robotTwo:getName() .. "," .. robotThree:getName()
    local tableNames = table.concat(tableRandomNames, ",")

    luaUnit.assertEquals(tableExpectedNames, tableNames)
end 

os.exit( luaUnit.LuaUnit.run() )