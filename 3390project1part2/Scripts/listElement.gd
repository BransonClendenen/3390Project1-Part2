extends ColorRect

@export var label: Label

func setup(data: Dictionary):
	label.text = "%s + %s" % [data["option"], data["weight"]]
