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


