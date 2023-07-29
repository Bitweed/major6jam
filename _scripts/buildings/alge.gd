extends Node2D

#
#@export var food_power = 1
#@export var respawn_time = 1
#var consumer: Node2D


#func _on_food_area_area_entered(area):
#	var mb_cons = area.get_parent()
#	# пропускаем если есть потребитель
#	if consumer:
#		return
#
#	# добавляем потребителя, если его лимит не исчерпан
#	if mb_cons.food_sources < mb_cons.fs_limit:
#		consumer = mb_cons
#		consumer.food_sources += 1
#		consumer.food_ps += float(food_power) / float(respawn_time)
#	else:
#		# СДЕЛАТЬ ПРЕДУПРЕЖДАЮЩИЙ ЗНАК, ЧТО ЛИМИТ ИСЧЕРПАН
#		pass

#func _on_food_area_area_exited(area):
#	if consumer == area.get_parent():
#		pass

var spawned: bool = false


func _process(delta):
	var neighbors_count = _get_neighbors()
	$Label.text = str(neighbors_count)
	if neighbors_count >= 7 and spawned == false:
		spawned = true
		_spawn_shrimp()


func _get_neighbors():
	var tilemap = GameManager.tilemap
	var neighbors_count = 0
	
	for x in range(-1, 2):
		for y in range(-1, 2):
			var neighbor = tilemap.get_cell_alternative_tile(0, tilemap.local_to_map(position) + Vector2i(x, y))
			if neighbor == 2:
				neighbors_count += 1
	return neighbors_count


func _spawn_shrimp():
	var mob = GameManager.shrimp.instantiate()
	mob.position = global_position
	
	mob.parent_alge = get_node(".")
	mob.finish_point = global_position
	
	GameManager.main_scene.add_child(mob)
