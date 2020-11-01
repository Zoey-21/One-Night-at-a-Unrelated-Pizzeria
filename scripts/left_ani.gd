extends Sprite


func _physics_process(_delta):
	if $"/root/Global".vars.monkey_pos == 3:
		self.visible = true
	else:
		self.visible = false
