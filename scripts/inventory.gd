extends Node

var bottle_count = 0

func add_bottles(amount):
	bottle_count += amount
	print("Bottles added. Current count:", bottle_count)

func remove_bottles(amount):
	bottle_count = max(bottle_count - amount, 0)

func get_bottle_count():
	return bottle_count
