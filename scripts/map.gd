extends Sprite

onready var global = $"/root/Global"
func _on_cam1_input_event(_viewport, _event, _shape_idx):
	switch(0)

func _on_cam2_input_event(_viewport, _event, _shape_idx):
	switch(1)

func _on_cam3_input_event(_viewport, _event, _shape_idx):
	switch(2)

func _on_cam4_input_event(_viewport, _event, _shape_idx):
	switch(3)

func _on_cam5_input_event(_viewport, _event, _shape_idx):
	switch(4)

func _on_cam6_input_event(_viewport, _event, _shape_idx):
	switch(5)

func _on_cam7_input_event(_viewport, _event, _shape_idx):
	switch(6)
			
func switch(cam):
		if Input.is_action_just_pressed("click"):
			global.vars.cam_shown = cam
