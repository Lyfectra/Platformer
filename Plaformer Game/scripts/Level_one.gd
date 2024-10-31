extends Node2D
@onready var time = $Time

#when the scene is loaded everything is unpaused and the "restart" function in the "Gem" singleton is caled
func _ready():
	get_tree().paused = false

