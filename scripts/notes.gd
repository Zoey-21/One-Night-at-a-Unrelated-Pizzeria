extends Node2D


func _physics_process(_delta):
	if Input.is_action_just_pressed("click"):
		get_tree().change_scene("res://office.tscn")
