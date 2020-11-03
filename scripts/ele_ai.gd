extends Node
var rand = rand_range(0,2)

func _physics_process(_delta):
		if $walk.is_stopped() != false:
			$walk.start()

		if $"/root/Global".vars.ele_pos == 5 and $enter.is_stopped():
			$walk.paused = true
			$enter.set_wait_time(12- $"/root/Global".vars.time)
			$enter.start()

		if $"/root/Global".vars.ele_pos == 6:
			if $"/root/Global".vars.cam == false:
				get_node("../jump_elefent").play("jump")
				get_node("../").make_sound("res://resorces/sounds/jump.wav",4)
				$"/root/Global".reset()
			if $jump.is_stopped():
				$jump.start()

func _on_walk_timeout():
		$"/root/Global".vars.ele_pos += 1
		cap_neg()

func cap_pos():
	if $"/root/Global".vars.monkey_pos >= 7:
		$"/root/Global".vars.monkey_pos = 6
func cap_neg():
		if $"/root/Global".vars.ele_pos <= -1:
			$"/root/Global".vars.ele_pos = 0

func _on_enter_timeout():
		if $"/root/Global".vars.door_right_down == false:
			$"/root/Global".vars.ele_pos = 6
		else:
			$walk.paused = false
			$"/root/Global".vars.ele_pos = 0
			get_node("../").make_sound("res://resorces/sounds/door_hit.wav",4)


func _on_jump_timeout():
		if $"/root/Global".vars.cam == true:
			get_node("../camra/AnimationPlayer").play("close")
			$"/root/Global".vars.cam = false
