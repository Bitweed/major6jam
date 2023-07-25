extends Node2D


var block = preload("res://prefabs/buildings/coral_1.tscn")

func _ready():
	GameManager.tilemap = $TileMap
	GameManager.buildings = $Buildings


#func _place_cell(x, y, tile_num):
#	$TileMap.set_cell(0, Vector2i(x, y), tile_num, Vector2i(0, 0))
