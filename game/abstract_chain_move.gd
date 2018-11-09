extends Node2D

var is_performing = false #is the move being performed right now
var hitbox_enabled = false #register attacks or not on this hitbox
var next_valid_actions = ["attack1", "attack2"]

#dynamic atomic variables
var selected_next_action = "" #next pressed action to begin after this one is over
var anim = "" #animation to play during the move
var move_duration = 1.0 #actual time it takes to complete the move

#dynamic node references
var char_root #character root node
var hitbox #hitbox rectangel for signals
var next_chain_a1 #next chain member on attack1, node
var next_chain_a2 #next chain member on attack2, node
var timer #timer type for timeout of combo move

func _ready():
	init_move_vars()
	hitbox_enabled = false
	timer.wait_time = move_duration
	timer.connect("timeout", self, "_on_move_time_end")
	timer.stop()
	pass

func _process(delta):
	#while the move is hapening we can try set which move comes next
	if (is_performing):
		for action in next_valid_actions:
			if (Input.is_key_pressed(action)):
				selected_next_action = action
	pass

#starts combo move sequence. 
#all combo moves need to have this method 
#(and will if inhertinig from this script)
func begin(animator):
	timer.start()
	is_performing = true
	animator.play(anim)
	hitbox_enabled = true
	pass

#child scripts need to override 
#this and set initial move params
func init_move_vars():
	pass


func _on_move_time_end():
	
	is_performing = false
	hitbox_enabled = false
	
	#try continue selected attack chain
	if (selected_next_action == "attack1" && next_chain_a1):
		next_chain_a1.begin()
	elif (selected_next_action == "attack2" && next_chain_a2):
		next_chain_a2.begin()
	else:
		#none selected or available - signal end of combo
		emit_signal("combo_over")
	pass
