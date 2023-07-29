extends Control

@onready var preview_block = preload("res://prefabs/preview_block.tscn")

# exporting parameters
@export var preview_block_texture: Texture2D
@export var y_margin = 0
@export var tile_num: int
@export var cost: int
@export var item_name = "Coral"
@export var tile_size = 1


func _ready():
	$Button/Cost.text = str(cost) + " ₵"
	$textures/IconPreview.texture = preview_block_texture
	$textures/Name.text = item_name
	$textures/IconPreview.position.y += y_margin

# shoping process
func _on_button_pressed():
	var shop = get_parent()
	
	if GameManager.coins >= cost && GameManager.is_bought == false:
		GameManager.is_bought = true
		
		# spawn preview block
		var new_preview_block = preview_block.instantiate()
		GameManager.main_scene.add_child(new_preview_block)
		new_preview_block.position = Vector2(0, 0)
		
		# settings
		new_preview_block.get_node("texture").texture = preview_block_texture
		new_preview_block.tile_num = tile_num
		new_preview_block.size = tile_size
		new_preview_block.price = cost
		
		GameManager.build_mode = true
