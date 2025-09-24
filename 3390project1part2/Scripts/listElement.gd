#extends ColorRect

@onready var label: Label = $listLabel

func setup(data: Dictionary):
	if label == null:
		print("ERROR: Label node not assigned!")
		return
	label.text = "%s + %s" % [data["option"], data["weight"]]
