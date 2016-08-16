local GameClass = {}

GameClass.name = ""
GameClass.host = nil
GameClass.players = {}
GameClass.board = nil

function ActiveGame(name, host, players, board)

	local newBoard = table.Copy( BoardClass )
	newBoard.name = name
	newBoard.players = players
	newBoard.board = board
	return newBoard

end