extends Control

var display_scene = preload("res://CaptionDisplay.tscn")

var controls
var display
var label: Label
var text_timer: Timer

var text_len: int
var text: String

# Called when the node enters the scene tree for the first time.
func _ready():
	var controls = get_viewport()
	controls.gui_embed_subwindows = false
	var display = display_scene.instantiate()
	add_child(display)
	
	controls.size = Vector2(500, 300)
	display.size = Vector2(500, 300)
	display.position = controls.position + Vector2i(0, 150)
	controls.position -= Vector2i(0, 210)
	
	label = display.get_node("Label")



func _on_line_edit_text_submitted(new_text: String):
	text = new_text
	text_len = 0
	
	# setup timer
	text_timer = Timer.new()
	add_child(text_timer)
	text_timer.timeout.connect(_on_Timer_timeout)
	text_timer.set_wait_time(0.2)
	text_timer.set_one_shot(false) # Make sure it loops
	text_timer.start()

func _on_Timer_timeout():
	if text_len > text.length():
		text_timer.queue_free()
	label.text = text.substr(0, text_len)
	text_len += 1

