extends State

func physics_update(_delta: float) -> void:
	var input_dir: Vector2 = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	if not input_dir:
		transitioned.emit(self, "idle")
		return
	
	var speed: float = 5.0
	
	player.velocity.x = player.desired_direction.x * speed
	player.velocity.z = player.desired_direction.z * speed
	
	var model = player.get_node("Model")
	var target_angle = atan2(player.desired_direction.x, player.desired_direction.z)
	model.rotation.y = lerp_angle(model.rotation.y, target_angle, 10.0*_delta)
		
	if not player.is_on_floor():
		player.velocity.y -= 9.8 * _delta
	
	player.move_and_slide()

func enter() -> void:
	anim_player.play("mixamo_com_005", 0.3)
