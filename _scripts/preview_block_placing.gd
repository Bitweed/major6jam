extends Node2D

var tile_num: int
var size = 2

var x: int
var y: int
var size_sprite

var can_build = true
var areas: int

		
func _process(delta):
	
	if size == 2:
		$Size2x2.show()
		$SelfArea/Collision1x1.disabled = true
		size_sprite = $Size2x2
	else:
		$Size1x1.show()
		$SelfArea/Collision2x2.disabled = true
		size_sprite = $Size1x1
	
	
	# following tile for mouse
	var mouse_tile = GameManager.tilemap.local_to_map(get_global_mouse_position())
	var local_pos = GameManager.tilemap.map_to_local(mouse_tile)
	var world_pos = GameManager.tilemap.to_global(local_pos)
	global_position = world_pos
	
	x = mouse_tile.x
	y = mouse_tile.y
	
	
func _unhandled_input(event):
	if can_build and event is InputEventMouseButton && event.pressed && event.button_index == MOUSE_BUTTON_LEFT:
		# placing tile
		GameManager.main_scene.get_node("TileMap").set_cell(0, Vector2i(x, y), 0, Vector2i(0, 0), tile_num)
		
		GameManager.is_bought = false
		GameManager.build_mode = false
		queue_free()


func _on_area_2d_area_entered(area):
	can_build = false
	size_sprite.modulate = "f70012"
	areas += 1

func _on_area_2d_area_exited(area):
	areas -= 1
	if areas == 0:
		can_build = true
		size_sprite.modulate = "56dc00"
