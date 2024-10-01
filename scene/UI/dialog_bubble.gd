extends Control


var dialogs := []
var current_line := -1
var txtSpeed := 0.0

@onready var content: Label = $content


func _ready() -> void:
	hide()

func show_dialog(dialogs_text: Array):
	if current_line == -1 or dialogs != dialogs_text:
		dialogs = dialogs_text
		show_line(0)
		show()
	else:
		advance()


func show_line(line: int):
	current_line = line
	content.text = dialogs[current_line]
	
	#气泡动画
	var tween := create_tween()
	tween.set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_SINE)
	tween.tween_property(self, "scale", Vector2.ONE, 0.2).from(Vector2.ZERO)
	
	#打字机动画
	txtSpeed = content.text.length() * 0.1  #每个字符的单位时间
	var t := create_tween()
	t.set_ease(Tween.EASE_IN).set_trans(Tween.TRANS_SINE)
	t.tween_property(content, "visible_ratio", 1.0, txtSpeed).from(0.0)


func advance():
	if current_line + 1 < dialogs.size():
		show_line(current_line + 1)
	else:
		current_line = -1
		hide()


func _on_content_gui_input(event: InputEvent) -> void:
	if event.is_action_pressed("interact"):
		advance()
