extends TextureRect


func _ready() -> void:
	Hud.hide()


func _on_new_pressed() -> void:
	SceneChanger.change_scene("res://scene/H1.tscn")


func _on_load_pressed() -> void:
	pass # Replace with function body.


func _on_quit_pressed() -> void:
	get_tree().quit()
