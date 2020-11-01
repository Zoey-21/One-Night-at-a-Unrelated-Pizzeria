extends Area2D

onready var global = $"/root/Global"
onready var anim = $AnimationPlayer

func _on_Area2D_input_event(_viewport, _event, _shape_idx):
	if !$AnimationPlayer.is_playing():
		if global.vars.cam:
			anim.play("close")
		else:
			anim.play("open")
		global.vars.cam = !global.vars.cam
