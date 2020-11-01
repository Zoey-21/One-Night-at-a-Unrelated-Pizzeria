extends Node
var rand = rand_range(0,2)

func _physics_process(_delta):
	if $"/root/Global".vars.monkey_pos == 3 and $enter.is_stopped():
		$walk.paused = true
		$enter.set_wait_time(12- $"/root/Global".vars.time)
		$enter.start()

	if $"/root/Global".vars.monkey_pos == 5:
		if $"/root/Global".vars.cam == false:
			get_node("../jump_monkey").play("jump")
			get_node("../").make_sound("res://resorces/sounds/jump.wav",4)
			$"/root/Global".reset()
		if $jump.is_stopped():
			$jump.start()

func _on_walk_timeout():
	if ($"/root/Global".vars.cam_shown == 0 and $"/root/Global".vars.monkey_pos == 0) or ($"/root/Global".vars.cam_shown == 2 and $"/root/Global".vars.monkey_pos == 1 or 2):
		rand = rand_range(0,2)
		if rand <= 1:
			return
		else:
			rand = rand_range(0,2 - ($"/root/Global".vars.time *0.1))
			if rand <= 1:
				$"/root/Global".vars.monkey_pos += 1
			else:
				$"/root/Global".vars.monkey_pos = 1
	else:
		rand = rand_range(0,2 - ($"/root/Global".vars.time *0.1))
		if rand <= 1:
			$"/root/Global".vars.monkey_pos += 1
		else:
			$"/root/Global".vars.monkey_pos -= 1

	cap_neg()
	cap_pos()


func cap_neg():
	if $"/root/Global".vars.monkey_pos <= -1:
		$"/root/Global".vars.monkey_pos = 0

func cap_pos():
	if $"/root/Global".vars.monkey_pos >= 4:
		$"/root/Global".vars.monkey_pos = 3


func _on_enter_timeout():
	if $"/root/Global".vars.door_left_down == false:
		$"/root/Global".vars.monkey_pos = 5
	else:
		$walk.paused = false
		$"/root/Global".vars.monkey_pos = 0
		get_node("../").make_sound("res://resorces/sounds/door_hit.wav",4)


func _on_jump_timeout():
	if $"/root/Global".vars.cam == true:
		get_node("../camra/AnimationPlayer").play("close")
		$"/root/Global".vars.cam = false
