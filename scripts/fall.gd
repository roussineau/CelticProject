extends State

func physics_update(_delta: float) -> void:
	if spatial_sense.is_colliding():
		transitioned.emit(self, "land")
		return
	
	player.velocity.y -= 9.8 * _delta
	
	player.move_and_slide()


func enter() -> void:
	anim_player.play("mixamo_com_001", 0.3)
