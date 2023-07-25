extends Control

var block = preload("res://prefabs/buildings/coral_1.tscn")
@export var tile_num = 0
@export var cost = 0

func _ready():
	$Cost.text = str(cost)


# shoping process
func _on_button_pressed():
	var shop = get_parent()
	
	if shop.coins >= cost:
		# updating coins
		shop.update_coins(shop.coins - cost)
		
		# spawn block
		var p = block.instantiate()
		GameManager.buildings.add_child(p)
		p.position = Vector2(0, 0)
		p.tile_num = tile_num
