extends Node

@export var option_input: LineEdit
@export var weight_input: LineEdit
@export var add_button: Button
@export var remove_button: Button
@export var decision_button: Button

func _ready():
	add_button.pressed.connect(Callable(self, "_on_add_pressed"))
	remove_button.pressed.connect(Callable(self, "_on_remove_pressed"))
	decision_button.pressed.connect(Callable(self, "_on_decision_pressed"))

func _on_add_pressed():
	var option = option_input.text.strip_edges()
	var weight = weight_input.text.strip_edges()
	if option != "" and weight != "":
		var item = {"option" : option, "weight": float(weight)}
		get_node("/root/Model").add_item(item)
		option_input.text = ""
		weight_input.text = ""

func _on_remove_pressed():
	var model = get_node("/root/Model")
	if model.items.size() > 0:
		model.remove_item(model.items.size()-1)

func _on_decison_pressed():
	var model = get_node("/root/Model")
	model.make_decision()
