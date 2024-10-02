extends CanvasLayer


func _ready() -> void:
	#visible = get_tree().current_scene is Scene
	show()


func _on_menu_pressed() -> void:
	Game.back_to_title()
