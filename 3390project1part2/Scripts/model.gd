#extends Node

var items: Array = []
signal list_changed(new_items)
signal decision_made(chosen_item: Dictionary)

func add_item(option: String, weight: String):
	var data = {"option":option, "weight": float(weight)}
	items.append(data)
	emit_signal("list_changed",items)

func remove_item(index:int):
	if index >= 0 and index < items.size():
		items.remove_at(index)
		emit_signal("list_changed",items)

func make_decision():
	if items.size() == 0:
		return null
	
	#add up all the weight
	var total_weight = 0.0
	for item in items:
		total_weight += item["weight"]
		
	var r = randf() * total_weight
	for item in items:
		r -= item["weight"]
		if r <= 0:
			emit_signal("decision_made",item)
			return item
