------------------------------------------------------------------
-- Game Manager
-- Type: Server Side
-- Author: Bentech
-- Description:
-- Manages the allocation of different games when started
------------------------------------------------------------------

local gamesTable = {} --Games

function createGame()

	ActiveGame("GAME"..RandomString(10), host, players, board)

	gamesTable.insert()

end

function processGames()


end

function isStarted(game)


	return false
end

function RandomString(length)
	length = length or 1
	if length < 1 then return nil end
	local array = {}
	for i = 1, length do
		array[i] = string.char(math.random(32, 126))
	end
	return table.concat(array)
end