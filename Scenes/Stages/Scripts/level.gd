class_name Level extends Node2D

@export var tilemap_layer: TileMapLayer
@export var player: Player
@export var level_cleared_menu: CanvasLayer
@export var game_over_menu: CanvasLayer
var current_cleared_cube = 0
var TILE_OFFSET = Vector2(0, 24)

func _ready() -> void:
	get_tree().paused = false
	level_cleared_menu.retry_button.connect("pressed", _on_level_cleared_retry_pressed)
	game_over_menu.retry_button.connect("pressed", _on_game_over_retry_pressed)
	

func get_screen_pos_for_cell(grid_pos: Vector2i) -> Vector2:
	return tilemap_layer.map_to_local(grid_pos) + TILE_OFFSET

func get_spawn_pos() -> Vector2i:
	return Vector2i(39, 22)

func on_player_landed(grid_pos: Vector2i):
	var tile_data = tilemap_layer.get_cell_tile_data(grid_pos)
	var current_index = tile_data.get_custom_data("color_index")
	var target_index = tile_data.get_custom_data("target_index")
	
	if current_index == target_index:
		print("Skip Cube")
		return
	
	current_index += 1
	print("Current Cleared Cube Is : ", current_cleared_cube)
	var source_id = tilemap_layer.get_cell_source_id(grid_pos)
	
	if current_index == target_index:
		tilemap_layer.set_cell(grid_pos, source_id, Vector2i(0,4))
		current_cleared_cube += 1

func _on_level_cleared_retry_pressed():
	get_tree().reload_current_scene()

func _on_game_over_retry_pressed():
	get_tree().reload_current_scene()
