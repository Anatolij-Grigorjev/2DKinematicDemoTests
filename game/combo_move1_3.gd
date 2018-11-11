extends "res://abstract_chain_move.gd"

var move_in_range = 2.0 - 0.5
var move_speed = 150

func _process(delta):
	._process(delta)
	if (timer.time_left > move_in_range):
		char_root.linear_vel.x -= delta * move_speed
	
	


func init_move_vars():
	anim = "attack1_3"
	move_duration = 1.8
	timer = $Timer