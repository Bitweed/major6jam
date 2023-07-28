extends Node2D


@export var food_power = 1
@export var respawn_time = 1
var consumer: Node2D


func _on_food_area_area_entered(area):
	var mb_cons = area.get_parent()
	# пропускаем если есть потребитель
	if consumer:
		return
	
	# добавляем потребителя, если его лимит не исчерпан
	if mb_cons.food_sources < mb_cons.fs_limit:
		consumer = mb_cons
		consumer.food_sources += 1
		consumer.food_ps += float(food_power) / float(respawn_time)
	else:
		# СДЕЛАТЬ ПРЕДУПРЕЖДАЮЩИЙ ЗНАК, ЧТО ЛИМИТ ИСЧЕРПАН
		pass

func _on_food_area_area_exited(area):
	if consumer == area.get_parent():
		pass
