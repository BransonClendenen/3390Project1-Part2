extends Node

#@export var option_input: LineEdit 
#@export var weight_input: LineEdit
#@export var add_button: Button
#@export var remove_button: Button
#@export var decision_button: Button

@onready var button_decision: Button = $GUI/topBar/buttonDecision
@onready var input_option: TextEdit = $GUI/botBar/inputOption
@onready var input_weight: TextEdit = $GUI/botBar/inputWeight
@onready var button_add: Button = $GUI/botBar/buttonAdd
@onready var button_remove: Button = $GUI/botBar/buttonRemove

func _ready():
	button_add.pressed.connect(Callable(self, "_on_add_pressed"))
	button_remove.pressed.connect(Callable(self, "_on_remove_pressed"))
	button_decision.pressed.connect(Callable(self, "_on_decision_pressed"))

func _on_add_pressed():
	var option = input_option.text.strip_edges()
	var weight = input_weight.text.strip_edges()
	if option != "" or weight != "":
		get_node("Model").add_item(option, weight)
		input_option.text = ""
		input_weight.text = ""

func _on_remove_pressed():
	var model = get_node("/Controller/Model")
	if model.items.size() > 0:
		model.remove_item(model.items.size()-1)

func _on_decison_pressed():
	var model = get_node("/Controller/Model")
	model.make_decision()
