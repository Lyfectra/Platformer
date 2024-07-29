extends Node2D

@onready var player = $Player
@onready var kill_zone = $KillZone
@onready var control = $Player/Camera2D/UI/Control
@onready var gem = $Gem
@onready var gem_counter = $Player/Camera2D/UI/GemControl/GemCounter
var GemCollected = 0

func _ready():
	get_tree().paused = false

func _on_kill_zone_body_entered(player):
	get_tree().create_timer(1.5).timeout
	control.visible = true
	get_tree().paused = true



func _on_gem_body_entered(body):
	if body.is_in_group("Player"):
		print("+1 coin")
		GemCollected += 1
		gem_counter.text = GemCollected
		gem.queue_free()
