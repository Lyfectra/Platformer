extends Node2D

#when this scene is loaded it unpauses the game
func _ready():
	get_tree().paused = false
