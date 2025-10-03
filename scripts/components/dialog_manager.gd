extends Node2D
class_name DialogManager

var _current_dialog = 0
var _dialogs
var _dialog_node_count
var _start_in

func init_dialog(ctx: Dictionary) -> void:
	_dialog_node_count = ctx.DialogNodes.size()
	_dialogs = ctx.DialogNodes
	_start_in = ctx.StartIn
	next_dialog(_start_in)

func next_dialog(_dialog_node_id) -> void:
	for _node in _dialogs:
		if _node.ID == _dialog_node_id:
			_show_dialog({
				"title": _node.Title,
				"text": _node.Text,
				"options": _node.Options
			})


func _show_dialog(dialog: Dictionary) -> void:
	print(dialog.title)
	print(dialog.text)
	print("Options:")
	for option in dialog.options:
		print("- "+option.Placeholder)
