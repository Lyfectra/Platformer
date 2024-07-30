extends Node2D

@onready var ui = $Player/Camera2D/UI
@onready var player = $Player
@onready var control = $UI/Control
@onready var gem = $Gem
@onready var gem_counter = $Player/Camera2D/UI/GemControl/GemCounter
var GemCollected = 0


func _ready():
	get_tree().paused = false
	GemCollected = 0


func _on_gem_body_entered(body):
	if body.is_in_group("Player"):
		print("+1 coin")
		GemCollected += 1
		gem_counter.text += 1
		gem.queue_free()


