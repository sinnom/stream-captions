extends Control
class_name CaptionControls

signal submit(new_text:String)

func _on_line_edit_text_submitted(new_text:String):
	submit.emit(new_text)