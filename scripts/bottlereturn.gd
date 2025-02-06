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

	# Update inventory and cash
	Inventory.add_cash(total_cash)
	Inventory.remove_bottles(bottle_count)

	# Show confirmation message (optional)
	print("Sold " + str(bottle_count) + " bottles for $" + str(total_cash))
