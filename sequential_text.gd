extends Label

var target_text_len: int
var target_text: String


func _on_line_edit_text_submitted(new_text: String):
	target_text = new_text
	target_text_len = 0
	$Timer.start()

func _on_timer_timeout():
	if target_text_len > target_text.length():
		$Timer.stop()
	text = target_text.substr(0, target_text_len)
	target_text_len += 1

