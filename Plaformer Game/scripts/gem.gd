extends Area2D


func _on_body_entered(body):
	if body.is_in_group("Player"):
		Gem.pick_up_gem()
		queue_free()

