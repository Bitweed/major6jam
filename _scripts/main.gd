extends Node2D


var shop_window = preload("res://prefabs/shop_window.tscn")

func _ready():
	GameManager.tilemap = $TileMap
	GameManager.buildings = $Buildings
	
	get_viewport().set_embedding_subwindows(false)
	var draw_window = shop_window.instantiate()
	add_child(draw_window)
	draw_window.visible = true
	# draw_window.position = Vector2(800, 500)


#func _place_cell(x, y, tile_num):
#	$TileMap.set_cell(0, Vector2i(x, y), tile_num, Vector2i(0, 0))
