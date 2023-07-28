extends Control


var ovner: Node2D


func _process(delta):
	$Name.text = ovner.block_name
	$FoodSec.text = "Food/sec: " + str(snapped(ovner.food_ps, 0.01))
	$FoodSources.text = "Food sources: " + str(ovner.food_sources) + "/" + str(ovner.fs_limit)
	
	if GameManager.build_mode:
		_closing()


func _closing():
	GameManager.block_menu = false
	queue_free()


func _on_texture_button_pressed():
	_closing()
