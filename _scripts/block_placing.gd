extends Node2D


func _ready():
	pass


func _process(delta):
	var mouse_tile = GameManager.tilemap.local_to_map(get_global_mouse_position())
	var local_pos = GameManager.tilemap.map_to_local(mouse_tile)
	var world_pos = GameManager.tilemap.to_global(local_pos)
	global_position = world_pos
	
	
func _unhandled_input(event):
	if event is InputEventMouseButton && event.pressed && event.button_index == MOUSE_BUTTON_LEFT:
		
		# random rotation
		var dir = -1
		if randi() % 2:
			dir = 1    
		$texture.scale.x = dir
	
		set_process(false)
		set_process_unhandled_input(false)
