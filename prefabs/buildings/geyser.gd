extends Node2D


func _on_timer_timeout():
	$Timer.start()
	GameManager.SomeResource += 1
