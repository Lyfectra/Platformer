extends Area2D

@onready var gem_counter = $GemControl/GemCounter
var collected = 0


func _on_body_entered(body):
	#collected += 1
	#gem_counter.text = collected
	#print(gem_counter.text)
	queue_free()
