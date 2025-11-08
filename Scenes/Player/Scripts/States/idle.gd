extends PlayerState

func enter(previous_state_path: String, data := {}) -> void:
	if player.input_buffer != Vector2i.ZERO:
		finished.emit(HOPPING)

func handle_input(_event: InputEvent) -> void:
	var move_dir = Vector2i.ZERO
	
	if _event.is_action_pressed("Up"):
		move_dir = Vector2i(1, 0)
	elif _event.is_action_pressed("Right"):
		move_dir = Vector2i(0, 1)
	elif _event.is_action_pressed("Left"):
		move_dir = Vector2i(0, -1)
	elif _event.is_action_pressed("Down"):
		move_dir = Vector2i(-1, 0)

	if move_dir != Vector2i.ZERO:
		player.input_buffer = move_dir
	
	finished.emit(HOPPING)
