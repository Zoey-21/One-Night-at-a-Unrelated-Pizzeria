extends Sprite


onready var global = $"/root/Global"

func _physics_process(delta):
	if global.vars.cam == true:
		for n in self.get_children():
			n.visible = false
		$map.visible = true
		match global.vars.cam_shown:
			0:
				setup("cam_1")
				
				if global.vars.monkey_pos == 0:
					$cam_1/monkey.visible = true
					
				if global.vars.ele_pos == 0:
					$cam_1/elephent.visible = true
				if global.vars.ele_pos == 1:
					$cam_1/elephent_1.visible = true
				
				match global.vars.deer_part:
					0:
						$cam_1/deer_1.visible = true 
					1:
						$cam_1/deer_2.visible = true 
					2:
						$cam_1/deer_3.visible = true 
					3:
						$cam_1/deer_4.visible = true 
					4:
						$cam_1/deer_5.visible = true 
					5:
						$cam_1/deer_6.visible = true 
			1:
				setup("cam_2")
				if global.vars.ele_pos == 2:
					$cam_2/elephent.visible = true
				if global.vars.ele_pos == 3:
					$cam_2/elephent_1.visible = true
				if global.vars.ele_pos == 4:
					$cam_2/elephent_2.visible = true
			2:
				setup("cam_3")
				if global.vars.monkey_pos == 1:
					$cam_3/monkey.visible = true
				if global.vars.monkey_pos == 2:
					$cam_3/monkey_1.visible = true
			3:
				setup("cam_4")
				deer(0,"cam_4")
			4:
				setup("cam_5")
				deer(1,"cam_5")
			5:
				setup("cam_6")
				deer(2,"cam_6")
			6:
				setup("cam_7")
				deer(3,"cam_7")


func setup(cam):
	get_node(cam).visible = true
	for n in get_node(cam).get_children():
		n.visible = false

func deer(cam,cams):
	if $"/root/Global".vars.deer_cam == cam and $"/root/Global".vars.deer_part == 0:
		get_node(cams).get_node("hand").visible = true
	if $"/root/Global".vars.deer_cam == cam and $"/root/Global".vars.deer_part == 1:
		get_node(cams).get_node("hand").visible = true
	if $"/root/Global".vars.deer_cam == cam and $"/root/Global".vars.deer_part == 2:
		get_node(cams).get_node("horn").visible = true
	if $"/root/Global".vars.deer_cam == cam and $"/root/Global".vars.deer_part == 3:
		get_node(cams).get_node("horn_1").visible = true
	if $"/root/Global".vars.deer_cam == cam and $"/root/Global".vars.deer_part == 4:
		get_node(cams).get_node("head").visible = true
		
