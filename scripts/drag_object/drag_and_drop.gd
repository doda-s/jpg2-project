extends Node2D

class_name dragAndDrop

var grab_object_stack = []

#TODO: verificar se é necessário deixar essa opção rodando, as vezes fica melhor sem ter que ativar e desativar
func _process(delta):
# metodos para controlar se o drag and drop está ativo ou não
	if int(Input.is_action_just_pressed("ctrl_click")):
		update_grabbable_state(false)

# metodos para controlar se o drag and drop está ativo ou não
	if int(Input.is_action_just_released("ctrl_click")):
		update_grabbable_state(true)

# exemplo de como poderam ser inicializados
func _ready():
	var grabable_object_list = get_tree().get_nodes_in_group("grabbable_objects_group")
	# adiciona items grabable na lista de ordenação
	for obj in grabable_object_list:
		add_grab_object(obj)

func add_grab_object(grab_object):
	grab_object_stack.append(grab_object)
	
	var count = 0
	for object in grab_object_stack:
		object.z_index = count
		
		count += 1

func push_paper_to_top(grab_object):
	grab_object_stack.erase(grab_object)
	add_grab_object(grab_object)

func update_grabbable_state(disabled: bool):
	for grab_object in grab_object_stack:
			for object in grab_object.get_children():
				if object is CollisionShape2D:
					object.disabled = disabled
