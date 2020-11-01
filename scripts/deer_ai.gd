extends Node

var last_rand = 0
var cam
func _physics_process(_delta):
	if $"/root/Global".vars.time == 2:
		if $delay.is_stopped() != false:
			$delay.start()
		if $"/root/Global".vars.deer_part == 5:
			if $"/root/Global".vars.cam == false:
				get_node("../jump_deer").play("jump")
				get_node("../").make_sound("res://resorces/sounds/jump.wav",4)
				$"/root/Global".reset()
			if $jump.is_stopped():
				$jump.start()

func _on_delay_timeout():
	var rand = randi() % 4 
	if last_rand == rand:
		rand = randi() % 4 
	print(rand)
	last_rand = rand
	match rand:
		0:
			$"/root/Global".vars.deer_cam = 0
		1:
			$"/root/Global".vars.deer_cam = 1
		2:
			$"/root/Global".vars.deer_cam = 2
		3:
			$"/root/Global".vars.deer_cam = 3
	$delay.paused = true
	$wait.start()


func _on_wait_timeout():
	match $"/root/Global".vars.deer_part:
		0:
			deer_drop("arm")
		1:
			deer_drop("arm_1")
		2:
			deer_drop("horn")
		3:
			deer_drop("horn_1")
		4:
			deer_drop("head")

func deer_drop(ani):
	get_node("../deer_parts").play(ani)
	get_node("../").make_sound("res://resorces/sounds/deer_hit.ogg",0)
	$"/root/Global".vars.deer_part += 1
	$delay.paused = false


func _on_shock_input_event(_viewport, _event, _shape_idx):
	if Input.is_action_just_pressed("click"):
		get_node("../").make_sound("res://resorces/sounds/buzz.ogg",0)
		if $"/root/Global".vars.deer_cam == $"/root/Global".vars.cam_shown - 3:
			$wait.stop()
			$wait.wait_time = 20
			$delay.paused = false


func _on_jump_timeout():
	if $"/root/Global".vars.cam == true:
		get_node("../camra/AnimationPlayer").play("close")
		$"/root/Global".vars.cam = false



