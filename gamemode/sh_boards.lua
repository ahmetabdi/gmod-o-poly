------------------------------------------------------------------
-- Boards
-- Type: Shared
-- Author: Bentech
-- Description:
-- Different boards that are available
------------------------------------------------------------------

local BoardClass = {}

BoardClass.name = ""
BoardClass.code = ""
BoardClass.spawnLocation = Vector()
BoardClass.boardLocation = Vector()
BoardClass.properties = {}
BoardClass.properties = {}

function Board( code, name, spawnLocation, boardLocation, properties )

	local newBoard = table.Copy( BoardClass )
	newBoard.name = name
	newBoard.code = code
	newBoard.spawnLocation = spawnLocation
	newBoard.boardLocation = boardLocation
	newBoard.properties = properties
	--Return our new Object.
	return newBoard

end

Boards = {}