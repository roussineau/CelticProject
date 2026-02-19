extends CharacterBody3D

@export var camera_drone: Node3D
var desired_direction: Vector3 = Vector3.ZERO

func _physics_process(_delta: float) -> void:
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	if input_dir && camera_drone:
		var cam_basis = camera_drone.global_transform.basis
		desired_direction = (cam_basis * Vector3(input_dir.x, 0, input_dir.y))
		desired_direction.y = 0
		desired_direction = desired_direction.normalized()
	else:
		desired_direction = Vector3.ZERO
