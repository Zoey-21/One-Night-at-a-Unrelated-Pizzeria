extends Area2D

onready var door = $door_left
onready var global = $"/root/Global"
onready var anim = $AnimationPlayer

func _on_Area2D_input_event(_viewport, _event, _shape_idx):
		if Input.is_action_just_pressed("click"):
			get_node("../").make_sound("res://resorces/sounds/press.wav",0)
			if global.vars.door_left_down:
				anim.play("open")
				$opener.stop()
			else:
				anim.play("close")
			global.vars.door_left_down = !global.vars.door_left_down
			$opener.start()


func _on_opener_timeout():
	get_node("../").make_sound("res://resorces/sounds/press.wav",0)
	anim.play("open")
	global.vars.door_left_down = false
