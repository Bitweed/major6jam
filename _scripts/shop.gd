extends Control

var coins = 2000


func _ready():
	$Coins.text = str(coins)


func update_coins(new_coins):
	coins = new_coins
	$Coins.text = str(coins)
