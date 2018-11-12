extends "res://abstract_chain_move.gd"

var already_shot = false
var left_at_shot_time
var will_shoot = false

func set_shot_time(shot_time):
	left_at_shot_time = move_duration - shot_time
	will_shoot = true

func _process(delta):
	._process(delta)
	if (is_performing and will_shoot):
		if (timer.time_left <= left_at_shot_time and not already_shot):
			do_shot()
			already_shot = true
			
func reset_move_vars():
	.reset_move_vars()
	already_shot = false
