extends Control

var block = preload("res://prefabs/buildings/coral_1.tscn")
@export var cost = 0

func _ready():
	$Cost.text = str(cost)



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _on_button_pressed():
	var shop = get_parent()
	if shop.coins >= cost:
		shop.update_coins(shop.coins - cost)
		var p = block.instantiate()
		GameManager.buildings.add_child(p)
		p.position = Vector2(0, 0)
