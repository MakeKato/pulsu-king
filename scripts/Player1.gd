extends AnimatedSprite  

func _ready():
	
	play("idle")  

func play_animation(animation_name: String):
	play(animation_name)
