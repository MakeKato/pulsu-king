extends Button

func _ready():
	var style = StyleBoxFlat.new()
	style.bg_color = Color(0.2, 0.2, 0.2)  
	style.border_color = Color(0.78, 0.78, 0.78) 
	style.border_width_top = 2  
	style.border_width_bottom = 2  
	style.border_width_left = 2  
	style.border_width_right = 2  
	
	
	self.add_stylebox_override("normal", style) 
	self.add_stylebox_override("hover", style)   
	self.add_stylebox_override("pressed", style) 
	
