extends Node2D

onready var dim = $office_dim
var rand_1 = rand_range(0,100)

func _physics_process(_delta):
#	if rand_1 <=10:
#		var rand = rand_range(0,100)
#		if rand <= 20:
#			rand_1 = rand_range(0,100)
#			dim.visible = true
#		else:
#			dim.visible = false
#	else:
#		rand_1 = rand_range(0,100)

	if Input.is_action_just_pressed("ui_accept"): OS.window_fullscreen = !OS.window_fullscreen

	if $clock.get_time_left() <= 375:
		$clock_nums/clock1.visible = true
		$"/root/Global".vars.time = 1
		
	if $clock.get_time_left() <= 300:
		$clock_nums/clock2.visible = true
		$"/root/Global".vars.time = 2
		
	if $clock.get_time_left() <= 225:
		$clock_nums/clock3.visible = true
		$"/root/Global".vars.time = 3
		
	if $clock.get_time_left() <= 150:
		$clock_nums/clock4.visible = true
		$"/root/Global".vars.time = 4
		
	if $clock.get_time_left() <= 75:
		$clock_nums/clock5.visible = true
		$"/root/Global".vars.time = 5
		
func _on_clock_timeout():
	get_tree().change_scene("res://end.tscn")



func _on_jump_deer_animation_finished(_anim_name):

	get_tree().change_scene("res://start.tscn")


func make_sound(audio,vol):
	audio = load(audio)
	var sound = AudioStreamPlayer.new()
	self.add_child(sound)
	sound.set_stream(audio)
	sound.set_volume_db(vol)
	sound.play()
