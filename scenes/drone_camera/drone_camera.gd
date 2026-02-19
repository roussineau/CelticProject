extends Node3D

@export var target: Node3D
@export var smooth_speed: float = 10.0
var mouse_sensitivity: float = 0.008

@onready var spring_arm: SpringArm3D = $SpringArm3D

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func _physics_process(delta: float) -> void:
	if target:
		global_position = global_position.lerp(target.global_position, smooth_speed * delta)

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		rotate_y(-event.relative.x * mouse_sensitivity)
		spring_arm.rotate_x(-event.relative.y * mouse_sensitivity)
		spring_arm.rotation.x = clamp(spring_arm.rotation.x, -PI/2, PI/4)
	
	
