extends "res://abstract_shot_chain_move.gd"


func init_move_vars():
	anim = "attack1_2"
	move_duration = 1.5
	set_shot_time(0.75)
	timer = $Timer
	next_chain_a1 = $cmr_a1_3