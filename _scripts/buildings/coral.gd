extends Node2D


var food_ps: float = 0.0
var food_sources: int = 0
@export var fs_limit: int
@export var block_name: String


func _process(delta):
	# убираем кнопку, если уже открыто меню или режим строительства
	if GameManager.build_mode or GameManager.block_menu:
		$OpenMenuButton.hide()
	else:
		$OpenMenuButton.show()


# Открываем меню по кнопке
func _on_open_menu_button_pressed():	
	# загружаем менюшку
	var menu = GameManager.house_menu.instantiate()
	menu.position = GameManager.main_camera.position
	menu.ovner = get_node(".")
	GameManager.main_scene.get_node("CanvasLayer").add_child(menu)
	# открыто меню блоков
	GameManager.block_menu = true


# Добавляем жракич
func _on_food_timer_timeout():
	Resources.food += food_ps
