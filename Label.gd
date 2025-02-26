extends Label

func _ready():
	var style = StyleBoxFlat.new()
	style.bg_color = Color(1, 1, 1)  # White background (optional)
	self.add_stylebox_override("normal", style)
	
	var font_color = Color(0, 0, 0)  # Black text color
	self.add_color_override("font_color", font_color)
