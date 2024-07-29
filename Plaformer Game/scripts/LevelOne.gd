extends Node2D

const Ui = preload("res://scripts/UI.gd")
@onready var ui = $Player/Camera2D/UI
@onready var player = $Player
@onready var kill_zone = $KillZone
@onready var control = $UI/Control
@onready var gem = $Gem
@onready var gem_counter = $Player/Camera2D/UI/GemControl/GemCounter
@onready var timer = $KillZone/Timer
var GemCollected = 0
var test = Ui.new()

	
func _ready():
	get_tree().paused = false
	GemCollected = 0

func _on_kill_zone_body_entered(player):
	test.show_death()


func _on_gem_body_entered(body):
	if body.is_in_group("Player"):
		print("+1 coin")
		GemCollected += 1
		gem_counter.text += 1
		gem.queue_free()


