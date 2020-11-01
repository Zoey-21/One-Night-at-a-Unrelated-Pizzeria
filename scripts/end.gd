extends Node2D

func _ready():
	$AnimationPlayer.play("end")


func _on_AnimationPlayer_animation_finished(_anim_name):
	get_tree().change_scene("res://start.tscn")
