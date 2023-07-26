extends Control

var coins = 1053200


func _ready():
	$Coins.text = str(coins) + " ₵"


func update_coins(new_coins):
	coins = new_coins
	$Coins.text = str(coins) + " ₵"
