extends Area2D

@onready var control = $CanvasLayer/Control

func _on_body_entered(body):
	control.visible = true

