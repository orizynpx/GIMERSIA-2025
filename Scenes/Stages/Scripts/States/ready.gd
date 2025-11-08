extends LevelState

func handle_input(_event: InputEvent) -> void:
	if _event.is_pressed():
		finished.emit(PLAYING)
