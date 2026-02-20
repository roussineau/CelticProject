extends State

func physics_update(_delta: float) -> void:
	if player.velocity.y == 0:
		if spatial_sense.is_colliding():
			transitioned.emit(self, "land")
		else:
			transitioned.emit(self, "fall")
		return
	
	player.velocity.y -= 9.8 * _delta
	
	player.move_and_slide()

func enter() -> void:
	anim_player.play("mixamo_com_004", 0.3, 1.2)
