extends Node


var _player = null
const CHASE_SPEED= 200

func _physics_process(delta):
	if _player:
		var player_direction = (_player.position - self.position).normalized()
		move_and_slide(CHASE_SPEED * player_direction)

func _on_DetectPlayer_body_entered(body):
	if body.is_in_group("Player"):
		_player = body
func _on_DetectPlayer_body_exited(body):
	if body.is_in_group("Player"):
		_player = body
