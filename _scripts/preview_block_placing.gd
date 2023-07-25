extends Node2D

var tile_num = 0

var x = 0
var y = 0

func _process(delta):
	# following tile for mouse
	var mouse_tile = GameManager.tilemap.local_to_map(get_global_mouse_position())
	var local_pos = GameManager.tilemap.map_to_local(mouse_tile)
	var world_pos = GameManager.tilemap.to_global(local_pos)
	global_position = world_pos
	
	x = mouse_tile.x
	y = mouse_tile.y
	
	
func _unhandled_input(event):
	if event is InputEventMouseButton && event.pressed && event.button_index == MOUSE_BUTTON_LEFT:
		# placing tile
		get_parent().get_parent().get_node("TileMap").set_cell(0, Vector2i(x, y), 0, Vector2i(0, 0), tile_num)
		queue_free()
