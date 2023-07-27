extends Area2D


func _on_body_entered(body):
	body.can_place = false


func _on_body_exited(body):
	body.can_place = false
