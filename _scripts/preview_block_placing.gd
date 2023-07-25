extends Node2D

# var tile_num = 0
var block
var x = 0
var y = 0

func _process(delta):
	# following tile for mouse
	var mouse_tile = GameManager.tilemap.local_to_map(get_global_mouse_position())
	var local_pos = GameManager.tilemap.map_to_local(mouse_tile)
	var world_pos = GameManager.tilemap.to_global(local_pos)
	global_position = world_pos
	
	x = world_pos.x
	y = world_pos.y
	
	
func _unhandled_input(event):
	if event is InputEventMouseButton && event.pressed && event.button_index == MOUSE_BUTTON_LEFT:
		# placing tile
		# GameManager.tilemap.set_cell(0, Vector2i(x, y), tile_num, Vector2i(0, 0))
		var new_block = block.instantiate()
		new_block.position = Vector2(x, y)
		GameManager.buildings.add_child(new_block)
		
		queue_free()
