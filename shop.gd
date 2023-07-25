extends Control

var coins = 1000
# Called when the node enters the scene tree for the first time.
func _ready():
	$Coins.text = str(coins) # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	

func update_coins(new_coins):
	coins = new_coins
	$Coins.text = str(coins)
