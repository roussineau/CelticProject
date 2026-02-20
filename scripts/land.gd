extends State

func physics_update(_delta: float) -> void:
	var horizontal_move: Vector2 = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	if player.is_on_floor():
		if horizontal_move:
			transitioned.emit(self, "walk")
		else:
			transitioned.emit(self,"idle")
	
	player.velocity.y -= 9.8 * _delta
	
	player.move_and_slide()

func enter() -> void:
	anim_player.play("mixamo_com_002", 0.3)
