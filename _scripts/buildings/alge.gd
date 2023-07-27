extends Node2D


@export var food_power = 1
var consumer: Node2D


func _on_food_area_area_entered(area):
	var mb_cons = area.get_parent()
	# skip if have consumer
	if consumer:
		return
		
	if mb_cons.food_sources < mb_cons.fs_limit:
		consumer = mb_cons
		consumer.food_sources += 1
	else:
		# СДЕЛАТЬ ПРЕДУПРЕЖДАЮЩИЙ ЗНАК, ЧТО ЛИМИТ ИСЧЕРПАН
		pass

func _on_food_area_area_exited(area):
	if consumer == area.get_parent():
		pass


func _on_spawn_food_speed_timeout():
	if consumer:
		consumer.food_count += food_power
