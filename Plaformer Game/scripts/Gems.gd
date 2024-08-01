extends Node2D

var collected = 0
@onready var gem_counter = $CanvasLayer/GemControl/GemCounter


func _on_gem_body_entered(body):
	print("test")
	collected += 1
	gem_counter.text = collected
	queue_free()
