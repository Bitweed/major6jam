extends Node2D


var food_count = 0
var fish_count = 0


func _process(delta):
	var food_count = get_parent().food_count
	var fish_count = get_parent().food_sources
	
	$FoodCount.text = str(food_count)
	$FishCount.text = str(fish_count)
	
	if GameManager.build_mode:
		get_parent().menu_opened = false
		queue_free()

func _on_texture_button_pressed():
	get_parent().menu_opened = false
	queue_free()
