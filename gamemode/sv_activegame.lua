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

--OVERALL GAMEMODE.STAGES--
--PICK PLAYER
NOT_STARTED = -1
WAITING_FOR_PLAYERS = 0
GAME_STARTING = 1
PICK_RANDOM_START = 2
ROLL_DICE_TO_START = 3
PICK_HIGHEST = 4
--START TURN
ROLL_DICE = 5
DICE_LAND = 6
LAND_BOARD = 7
GOTO_JAIL = 8
BUY_YES_NO = 9
AUCTION = 10
TRADE = 11
CHECK_DOUBLE = 12
MANAGE_PROPERTY_STAGE = 13
NA = 14
END_TURN = 15
END_GAME = 16
--END TURN
