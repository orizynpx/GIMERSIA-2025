extends Control


@export var beat_per_minute: float = 70
@export var player: Player
var beat_per_second:float = 60/beat_per_minute

@onready var beat_timer = $BeatTimer
@onready var beat_indicator = $BeatIndicator

func _ready() -> void:
	beat_timer.wait_time = beat_per_second
	beat_timer.one_shot = false
	beat_timer.connect("timeout", _on_beat_timer_timeout)
	
func beat_start():
	beat_timer.start()

func beat_pause():
	beat_timer.paused = true

func beat_resume():
	beat_timer.paused = false

func beat_stop():
	beat_timer.stop()

func _on_beat_timer_timeout():
	if player.is_hopping:
		beat_indicator.color = Color.GREEN
		await get_tree().create_timer(0.2).timeout
		beat_indicator.color = Color.WHITE
		return
	
	TurnManager.player_turn_taken.emit(Vector2i.ZERO)
	
	beat_indicator.color = Color.RED
	await get_tree().create_timer(0.2).timeout
	beat_indicator.color = Color.WHITE
