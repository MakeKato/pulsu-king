extends Node

var bottle_count = 0
signal bottle_count_changed

func add_bottles(amount):
	bottle_count += amount
	emit_signal("bottle_count_changed", bottle_count)

func remove_bottles(amount):
	bottle_count = max(bottle_count - amount, 0)
	emit_signal("bottle_count_changed", bottle_count)

func get_bottle_count():
	return bottle_count
