extends LevelState

const TARGET_CLEARED_CUBE = 26

func enter(previous_state_path: String, data := {}) -> void:
	print("Game Started")

func update(_delta: float) -> void:
	if level.player.lives <= 0:
		finished.emit(GAME_OVER)
		return
	
	if level.current_cleared_cube > TARGET_CLEARED_CUBE:
		finished.emit(LEVEL_CLEARED)
		return
