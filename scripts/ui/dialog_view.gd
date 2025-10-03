extends Control
class_name DialogView

var title_text_reach
var text_text_reach
var options_vbox

func _ready() -> void:
	title_text_reach = get_node('Background/VBoxContainer/Title')
	text_text_reach = get_node('Background/VBoxContainer/Text')
	options_vbox = get_node('Background/VBoxContainer/Options')
	
	if title_text_reach == null:
		push_error("DialogView is missing title TextTeach.")
	if text_text_reach == null:
		push_error("DialogView is missing text TextReach.")
	if options_vbox == null:
		push_error("DialogView is missing title VBoxContainer.")

func show_dialog(_dialog) -> void:
	pass

func _load_options(options) -> void:
	pass
