extends Control

@onready var preview_block = preload("res://prefabs/preview_block.tscn")

# exporting parameters
@export var preview_block_texture = Texture2D
@export var block_to_place = preload("res://prefabs/buildings/coral.tscn")
# @export var tile_num = 0
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
		var new_preview_block = preview_block.instantiate()
		GameManager.buildings.add_child(new_preview_block)
		new_preview_block.position = Vector2(0, 0)
		
		# settings
		# p.tile_num = tile_num
		new_preview_block.get_node("texture").texture = preview_block_texture
		new_preview_block.block = block_to_place
