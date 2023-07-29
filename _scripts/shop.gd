extends Control


func _process(delta):
	$Coins.text = str(GameManager.coins) + " ₵"
