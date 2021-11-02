--- Compares the length between two tables
-- @param table1 The table 1
-- @param table2 The table 2
function compareLength(table1, table2) 
    if(#table1 ~= #table2) then
        return math.abs(#table1 - #table2)
    else 
        return 0
    end
end

--- Compares and calculate the number of corresponding symbols that differ in the two strings 
-- @param table1 The table 1
-- @param table2 The table 2
function compareStrings(table1, table2)
    local count = 0
    for key, value in pairs(table1) do
        if (value ~= table2[key]) then count = count + 1 end
    end

    local lengthDifference = compareLength(table1, table2)
    count = count + lengthDifference
    
    return count
end 

--- Calculates the Hamming distance between two strings
-- @param string1 The string 1
-- @param string2 The string 2
function calculateDistanceHamming(string1, string2)
    tableString1 = {}
    tableString2 = {}
    --Insert each symbol of the string into a position in a table
    string1:gsub('.',function(c) table.insert(tableString1,c) end)
    string2:gsub('.',function(c) table.insert(tableString2,c) end)

    local distanceHamming = compareStrings(tableString1, tableString2)

    return distanceHamming
end