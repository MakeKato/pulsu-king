extends Label

func _ready():
	update_bottle_count(Inventory.get_bottle_count())  # Initialize text
	Inventory.connect("bottle_count_changed", self, "update_bottle_count")

func update_bottle_count(new_count):
	text = "Pulloja: %d" % new_count
