#extends Control

#@export var container: VBoxContainer
#@export var item_scene: PackedScene
#@export var result_label: Label

@onready var container: VBoxContainer = $ScrollContainer/VBoxContainer
const LIST_ELEMENT = preload("res://Scenes/listElement.tscn")


func _ready():
	var model = get_parent().get_node("Model")
	model.connect("list_changed",Callable(self,"_on_list_changed"))
	model.connect("decision_made",Callable(self,"_on_decision_made"))

func _on_list_changed(new_items):
	for child in container.get_children():
		child.queue_free()
	for data in new_items:
		var element = LIST_ELEMENT.instantiate()
		if element.has_method("setup"):
			element.setup(data)
		container.add_child(element)

#func _on_decision_made(item: Dictionary):
#	result_label.text = "Chosen: %s + %s" % [item["option"], item["weight"]]
#	print(result_label.text)
