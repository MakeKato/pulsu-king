extends Area2D

export(float) var bottle_price = 0.2  # Cash per bottle

func _on_Area2D2_body_entered(body):
	if body.is_in_group("Player"):  # Assuming the player is named "Player"
		if Inventory.get_bottle_count() > 0:
			sell_bottles()
		else:
			print("You don't have any bottles to sell!")

func sell_bottles():
	var bottle_count = Inventory.get_bottle_count()
	var total_cash = bottle_count * bottle_price

	# Debugging: Print the bottle count and total cash
	print("Bottles to sell: ", bottle_count)
	print("Total cash to add: $", total_cash)

	# Update inventory and cash
	Inventory.add_cash(total_cash)
	Inventory.remove_bottles(bottle_count)

	# Show confirmation message
	print("Sold " + str(bottle_count) + " bottles for $" + str(total_cash))

	# Verify cash and bottle count after selling
	print("Updated Cash: $", Inventory.get_cash())
	print("Updated Bottle Count: ", Inventory.get_bottle_count())
