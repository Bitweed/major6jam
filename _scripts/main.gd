extends Node2D


var shop_window = preload("res://prefabs/shop_window.tscn")

func _ready():
	GameManager.tilemap = $TileMap
	GameManager.buildings = $Buildings
	
	get_viewport().set_embedding_subwindows(false)
	var draw_window = shop_window.instantiate()
	add_child(draw_window)
	draw_window.visible = true

