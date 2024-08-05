extends Node

var gems_collected = 0

signal add_gem

func pick_up_gem():
	gems_collected += 1
	emit_signal("add_gem")

func restart():
	gems_collected = 0
