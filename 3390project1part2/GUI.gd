extends Control

@export var container: VBoxContainer
@export var item_scene: PackedScene
@export var result_label: Label

func _ready():
	var model = get_parent().get_node("Model")
	model.connect("list_changed",Callable(self,"_on_list_changed"))
	model.connect("decision_made",Callable(self,"_on_decision_made"))

func _on_list_changed(new_items):
	container.clear()
	for data in new_items:
		var element = item_scene.instanciate()
		if element.has_method("setup"):
			element.setup(data)
		container.add_child(element)

func _on_decision_made(item: Dictionary):
	result_label.text = "Chosen: %s + %s" % [item["option"], item["weight"]]
