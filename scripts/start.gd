extends Node2D


func _on_Button_pressed():
	get_tree().change_scene("res://notes.tscn")


func _on_Timer_timeout():
	var rand = randi() % 4 
	match rand:
		0:
			invis()
			$jump1.visible =true
		1:
			invis()
			$jump2.visible =true
		2:
			invis()
			$jump3.visible =true
		3:
			invis()
			$jump4.visible =true
		4:
			invis()
			$jump5.visible =true
		5:
			invis()
			$jump6.visible =true


func invis():
			$jump1.visible =false
			$jump2.visible =false
			$jump3.visible =false
			$jump4.visible =false
			$jump5.visible =false
			$jump6.visible =false


func _on_CheckBox_toggled(_button_pressed):
	OS.window_fullscreen = !OS.window_fullscreen
