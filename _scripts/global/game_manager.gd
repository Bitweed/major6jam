extends Node


@onready var house_menu = preload("res://prefabs/windows/coral_menu.tscn")

var main_camera: Camera2D

var tilemap: TileMap
var main_scene: Node2D

var build_mode: bool = false
var is_bought: bool = false
var block_menu: bool = false
