extends State

func physics_update(_delta: float) -> void:
	var horizontal_move: Vector2 = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var vertical_move = Input.is_action_just_pressed("ui_select")

	if not (horizontal_move || vertical_move):
		transitioned.emit(self, "idle")
		return
	elif player.is_on_floor() && vertical_move:
		player.velocity.y = 8.0 # jump force
		transitioned.emit(self, "jump")
		return
	elif not player.is_on_floor() && not vertical_move:
		transitioned.emit(self, "fall")
		return
	
	# Horizontal movement physic, continued without animation
	
	var speed: float = 5.0
	
	player.velocity.x = player.desired_direction.x * speed
	player.velocity.z = player.desired_direction.z * speed
	
	var model = player.get_node("Model")
	var target_angle = atan2(player.desired_direction.x, player.desired_direction.z)
	model.rotation.y = lerp_angle(model.rotation.y, target_angle, 10.0*_delta)
	
	player.move_and_slide()

func enter() -> void:
	anim_player.play("mixamo_com_005", 0.3)
