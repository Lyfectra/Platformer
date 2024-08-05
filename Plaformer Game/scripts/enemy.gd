extends Node2D

@onready var ray_cast_r = $RayCastR
@onready var ray_cast_l = $RayCastL
@onready var control = $Control

const SPEED = 50
var direction = 1

func _process(delta):
	if not ray_cast_l.is_colliding():
		direction = 1
	if not ray_cast_r.is_colliding():
		direction = -1
	position.x += direction * SPEED * delta


