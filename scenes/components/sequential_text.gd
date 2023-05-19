extends Label
class_name SequentialText

var target_text_len: int
var target_text: String


func render_text(new_text: String):
	target_text = new_text
	target_text_len = 0
	$Timer.start()

func _on_timer_timeout():
	if target_text_len > target_text.length():
		$Timer.stop()
	text = target_text.substr(0, target_text_len)
	$AudioStreamPlayer.play()
	target_text_len += 1

