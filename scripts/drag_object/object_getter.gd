extends Area2D

class_name ObjectGetter

func _ready():
	pass
	
func _process(_delta):
	position = get_global_mouse_position()

	var count = len(get_overlapping_bodies())
	if (count == 0):
		pass
	elif (count == 1):
		get_overlapping_bodies()[0].is_chosen()
		if (Input.is_action_just_pressed("mouse_click")):
			get_parent().push_paper_to_top(get_overlapping_bodies()[0])

	else:
		var max_index = -1
		var top_object = null
		for body in get_overlapping_bodies():
			if (body.z_index > max_index):
				max_index = body.z_index
				top_object = body
		
		top_object.is_chosen()
		for body in get_overlapping_bodies():
			if body != top_object:
				body.chosen = false
		if (Input.is_action_just_pressed("mouse_click")):
			get_parent().push_paper_to_top(top_object)
