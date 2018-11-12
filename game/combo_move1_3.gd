extends "res://abstract_shot_chain_move.gd"

var move_back_duration = 0.5
var move_speed = 250
var move_back_timer

func _process(delta):
	._process(delta)
	if (not move_back_timer.is_stopped()):
		char_root.linear_vel.x -= delta * move_speed

func init_move_vars():
	anim = "attack1_3"
	move_duration = 1.8
	set_shot_time(1.0)
	timer = $Timer
	move_back_timer = $TimerMoveBack
	move_back_timer.wait_time = move_back_duration
	move_back_timer.stop() 
	
func reset_move_vars():
	.reset_move_vars()
	move_back_timer.stop()
	
func begin(animator):
	.begin(animator)
	move_back_timer.start()