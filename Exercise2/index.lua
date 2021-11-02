-- Class Robot
Robot = {name = nil}
-- Table of Random Names
tableRandomNames = {}
-- Reset seed of function random
math.randomseed(os.time())

--- CTRO
function Robot:new()
    local obj = {}
    setmetatable(obj, {__index = self})
    return obj
end

--- Getters
function Robot:getName()
    return self.name
end

--- Robot start functionality
function Robot:start()
    self.name = generateRandomName()
end 

--- Robot reset functionality
function Robot:reset()
    removeRandomName(self.name)
    self.name = generateRandomName()
end

--- Generate the random name of the robot
function generateRandomName()
    local randomUpperCase = ""
    local randomNumber = ""
    local randomName

    -- generate two random uppercases
    repeat
        randomUpperCase = randomUpperCase .. string.char(math.random(65, 90))
    until( #randomUpperCase == 2 )
    -- generate three random numbers
    repeat
        randomNumber = randomNumber .. math.random(0, 9)
    until( #randomNumber == 3 )

    randomName = randomUpperCase .. randomNumber

    return storedRandomName(randomName)  
end

--- Store the generated random name in the table
-- @param randomName The random name of robot 
function storedRandomName(randomName)
    local existRandomName = checkRandomName(randomName)
    if existRandomName then 
        generateRandomName()
    else 
        table.insert(tableRandomNames, randomName)
    end
    return randomName
end

--- Check if the generated random name is in the table
-- @param randomName The random name of robot 
function checkRandomName(randomName)
    for key, value in pairs(tableRandomNames) do
        if value == randomName then
            return true
        end
    end
    return false
end

--- Remove the random name of the robot stored in the table
-- @param randomName The random name of robot 
function removeRandomName(randomName)
    for key, value in pairs(tableRandomNames) do
        if value == randomName then
            table.remove(tableRandomNames, key)
        end
    end
end