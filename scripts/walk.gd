extends State

@onready var player: CharacterBody3D = owner as CharacterBody3D

func physics_update(_delta: float) -> void:
	var input_dir: Vector2 = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	if not input_dir:
		transitioned.emit(self, "idle")
		return
		
	var res_dir: Vector3 = Vector3(input_dir.x, 0, input_dir.y)
	var speed: float = 5.0
	
	player.velocity.x = res_dir.x * speed
	player.velocity.z = res_dir.z * speed
	
	if not player.is_on_floor():
		player.velocity.y += 9.8 * _delta
	
	player.move_and_slide()
