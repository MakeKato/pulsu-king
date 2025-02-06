extends Label

func _process(_delta):
	text = "RAHAA: $" + str(Inventory.get_cash())
