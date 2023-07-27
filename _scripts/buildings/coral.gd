extends Node2D


var food_count = 0
var fish_count = 0

var food_sources = 0
@export var fs_limit: int

var menu_opened: bool = false


func _process(delta):
	if GameManager.build_mode:
		$OpenMenuButton.hide()
	if GameManager.build_mode == false:
		$OpenMenuButton.show()


func _on_open_menu_button_pressed():
	if menu_opened:
		return
		
	var menu = GameManager.house_menu.instantiate()
	menu.position = position + Vector2(0, -30)
	add_child(menu)
	
	menu_opened = true
