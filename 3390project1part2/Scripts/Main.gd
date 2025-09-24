extends Node

#bot bar
@onready var input_option: TextEdit = $GUI/botBar/inputOption
@onready var input_weight: TextEdit = $GUI/botBar/inputWeight
@onready var button_add: Button = $GUI/botBar/buttonAdd
@onready var button_remove: Button = $GUI/botBar/buttonRemove

#top bar
@onready var button_decision: Button = $GUI/topBar/buttonDecision

#container
@onready var vbox: VBoxContainer = $GUI/ScrollContainer/VBoxContainer
var list = [];

#event listeners
func _on_button_decision_pressed() -> void:
	var total_weight = 0
	for item in list:
		total_weight += item["weight"]
	
	if total_weight == 0:
		return
	
	var r = randi() % total_weight
	var running_sum = 0
	for item in list:
		running_sum += item["weight"]
		if r < running_sum:
			var window = AcceptDialog.new()
			window.set_text("You Should:" + item["option"] +"!")
			add_child(window)
			window.popup_centered()
			break

func _on_button_add_pressed() -> void:
	var option = input_option.text.strip_edges()
	var weight = input_weight.text.strip_edges()
	
	if option == "" or weight == "":
		input_option.clear()
		input_weight.clear()
		return
	
	var entry = {
		"option": option,
		"weight": int(weight)
	}
	list.append(entry)
	
	display_array()
	input_option.clear()
	input_weight.clear()
	

func _on_button_remove_pressed() -> void:
	if list.size() > 0:
		list.pop_back()  
		display_array()

func display_array() -> void:
	for child in vbox.get_children():
		child.queue_free()
	for item in list:
		var label = Label.new()
		label.text = "%s (Weight: %d)" % [item["option"], item["weight"]]
		vbox.add_child(label)

#keyboard input implementation
func _process(delta):
	if Input.is_action_just_pressed("enter_pressed"):
		_on_button_add_pressed()
	if Input.is_action_just_pressed("backspace_pressed"):
		_on_button_remove_pressed()
