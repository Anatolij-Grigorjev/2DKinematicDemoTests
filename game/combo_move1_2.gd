extends "res://abstract_chain_move.gd"


func init_move_vars():
	anim = "attack1_2"
	move_duration = 1.5
	timer = $Timer
	next_chain_a1 = $cmr_a1_3