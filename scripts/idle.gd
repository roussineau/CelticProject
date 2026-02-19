extends State

func physics_update(_delta: float) -> void:
	if not player.is_on_floor():
		player.velocity.y -= 9.8 * _delta
	
	player.velocity.x = 0
	player.velocity.z = 0
	player.move_and_slide()
	
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	if input_dir:
		transitioned.emit(self, "walk")

func enter() -> void:
	anim_player.play("mixamo_com_003", 0.3)
