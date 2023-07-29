extends Node2D


var shop_window = preload("res://prefabs/shop_window.tscn")
@onready var main_tilemap = $TileMap

func _ready():
	GameManager.tilemap = main_tilemap
	GameManager.main_camera = $Camera
	GameManager.main_scene = get_node('.')

	get_viewport().set_embedding_subwindows(false)
	var draw_window = shop_window.instantiate()
	add_child(draw_window)
	draw_window.visible = true
	
	DisplayServer.window_set_size(Vector2i(1280, 720))
