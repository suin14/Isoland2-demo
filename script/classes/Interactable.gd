extends Area2D
class_name Interactable

signal interacted

func _input_event(viewport: Viewport, event: InputEvent, shape_idx: int) -> void:
	if event.is_action_pressed("interact"):
		interact()


func interact() -> void:
	interacted.emit()
