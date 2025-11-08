class_name LevelState extends BaseState

const READY = "Ready"
const PLAYING = "Playing"
const LEVEL_CLEARED = "LevelCleared"
const GAME_OVER = "GameOver"

var level: Level

func _ready() -> void:
	await owner.ready
	level = owner as Level
	assert(level != null, "The LevelState state type must be used only in the level scene. It needs the owner to be a Level node.")
