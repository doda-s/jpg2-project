extends Node2D

var _interactable_component: InteractableComponent
var _dialog_handler: DialogHandler

func _ready() -> void:
	_interactable_component = get_node("InteractableComponent") as InteractableComponent
	if _interactable_component == null:
		push_error("Sign needs a InteractableComponent.")
	
	_dialog_handler = get_node("DialogHandler")
	if _dialog_handler == null:
		push_error("Sign needs a DialogHandler")
	
	if not _interactable_component.interaction_emitter.is_connected(_interact):
		_interactable_component.interaction_emitter.connect(_interact)

func _interact():
	print("Interagiu com a placa!")
	_dialog_handler._init_dialog()
