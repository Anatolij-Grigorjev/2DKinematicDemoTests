extends "res://abstract_chain_move.gd"


func init_move_vars():
	anim = "attack1_1"
	move_duration = 1.8
	timer = $Timer
	next_chain_a1 = $cmr_a1_2