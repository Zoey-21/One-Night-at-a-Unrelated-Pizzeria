extends Area2D


onready var global = $"/root/Global"
onready var anim = $AnimationPlayer

func _on_Area2D_input_event(_viewport, _event, _shape_idx):
		if Input.is_action_just_pressed("click"):
			get_node("../").make_sound("res://resorces/sounds/press.wav",0)
			if global.vars.door_left_dark:
				anim.play("light_up")
			else:
				anim.play("dark")
			global.vars.door_left_dark = !global.vars.door_left_dark
