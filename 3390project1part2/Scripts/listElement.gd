extends ColorRect

@onready var label: Label = $Label

func setup(data: Dictionary):
	if label == null:
		print("ERROR: Label node not assigned!")
		return
	label.text = "%s + %s" % [data["option"], data["weight"]]
