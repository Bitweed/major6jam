extends Node2D

var tile_num: int
var size = 2
var price

var x: int
var y: int
var size_sprite

var can_build = true
var areas: int

var mbl_pressed = false


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
	
	
	if GameManager.coins - price < 0:
		mbl_pressed = false
		GameManager.is_bought = false
		GameManager.build_mode = false
		queue_free()
		return
	
	if can_build and mbl_pressed and $BuildTimeout.is_stopped():
		GameManager.tilemap.set_cell(0, Vector2i(x, y), 0, Vector2i(0, 0), tile_num)
		# обновление счёта
		GameManager.update_coins(price)
		$BuildTimeout.start()
		
		
func _input(event):
	if event.is_action_pressed("MBL"):
		mbl_pressed = true
	elif event.is_action_released("MBL"):
		mbl_pressed = false
		# GameManager.tilemap.set_cell(0, Vector2i(x, y), 0, Vector2i(0, 0), tile_num)
		GameManager.is_bought = false
		GameManager.build_mode = false
		queue_free()


func _on_area_2d_area_entered(area):
	can_build = false
	size_sprite.modulate = "fc0000"
	areas += 1

func _on_area_2d_area_exited(area):
	areas -= 1
	if areas == 0:
		can_build = true
		size_sprite.modulate = "56dc00"
