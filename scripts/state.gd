class_name State
extends Node

signal transitioned(state: State, new_state_name: String)

# _ready()
func enter() -> void:
	pass

# _process()
func update(_delta: float) -> void:
	pass

# _physics_process()
func physics_update(_delta: float) -> void:
	pass

# Cleanup before leaving the state
func exit() -> void:
	pass
