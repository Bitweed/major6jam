extends CharacterBody2D


var finish_point: Vector2
var parent_alge: Node2D
var speed = 15

var finished: bool = true

func _process(delta):
	# Задержка перед новым ходом
	if finished and $Timer.is_stopped():
		finish_point = _get_rand_pos()
		finished = false
		
	# Если моб дошел до точки то добавляем задержку
	if finished == false and (int(global_position.x) - int(finish_point.x)) < 2 and (int(global_position.y) - int(finish_point.y)) < 2:
		finished = true
		$Timer.wait_time = randf_range(0.2, 2)
		$Timer.start()
	else:
		velocity = global_position.direction_to(finish_point) * speed
	
	# rotation
	if (int(global_position.x) - int(finish_point.x)) < 2:
		$Texture.flip_h = true
	else:
		$Texture.flip_h = false
	
	move_and_slide()
	
	
func _get_rand_pos():
	var map_rand_pos = GameManager.tilemap.map_to_local(Vector2i(
		randi_range(-2, 2), randi_range(-2, 2)
		) + GameManager.tilemap.local_to_map(parent_alge.global_position))
	return map_rand_pos
