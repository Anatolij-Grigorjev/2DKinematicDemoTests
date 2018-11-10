extends "res://abstract_chain_move.gd"


func init_move_vars():
	anim = "attack1_1"
	move_duration = 2.0
	#provide bit of offset to transition smoothly
	move_duration -= (move_duration * 0.1)
	timer = $Timer
	next_chain_a1 = $cmr_a1_2