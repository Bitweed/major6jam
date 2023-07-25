extends Node2D


var block = preload("res://prefabs/buildings/coral_1.tscn")

func _ready():
	GameManager.tilemap = $TileMap
	GameManager.buildings = $Buildings


func _on_button_pressed():
	var p = block.instantiate()
	$Buildings.add_child(p)
	p.position = Vector2(0, 0)
