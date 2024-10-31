extends Area2D

var gem_count = 0
#when the gem Area2d is entered by the player this function is called
func _on_body_entered(body):
	#calls the "pick_up_gem" function in the "Gem" singleton
		#Gem.pick_up_gem()
		#calls the built in "queue_free" function, which clears whatever it is linked to
		GemCounter.picked_up()
		queue_free()

