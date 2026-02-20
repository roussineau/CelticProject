extends State

func physics_update(_delta: float) -> void:
	if not player.is_on_floor():
		player.velocity.y -= 9.8 * _delta
	
	player.velocity.x = 0
	player.velocity.z = 0
	player.move_and_slide()
	
	var horizontal_move = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var vertical_move = Input.is_action_just_pressed("ui_select")
	
	if horizontal_move:
		transitioned.emit(self, "walk")
		return
	elif vertical_move:
		player.velocity.y = 8.0 # jump force
		transitioned.emit(self, "jump")
	

func enter() -> void:
	anim_player.play("mixamo_com_003", 0.3)
