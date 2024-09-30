extends Interactable
class_name  Teleporter

@export_file("*.tscn") var path: String

func interact() -> void:
	super()
	SceneChanger.change_scene(path)
