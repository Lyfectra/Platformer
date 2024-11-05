extends Area2D

#when the gem Area2d is entered by the player these functions are called
func _on_body_entered(body):
		Ui.gem_picked_up()
		#Removes the gem that was collected
		queue_free()

