extends Control

func _on_caption_controls_submit(new_text:String):
	$SequentialText.render_text(new_text)
