extends Control
class_name DraggableWindow
## Make ancestor window's whole surface draggable. 


@export var window: Window
var is_dragging: bool = false
var drag_start_position: Vector2i
var window_id: int

# Called when the node enters the scene tree for the first time.
func _ready():
	if window:
		window.window_input.connect(on_window_input)


func on_window_input(event: InputEvent):
	if event is InputEventMouseButton:
		if event.button_index == 1:
			is_dragging = !is_dragging
			drag_start_position = get_local_mouse_position()
			window_id = event.get_window_id()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if is_dragging:
		var new_position = DisplayServer.window_get_position(window_id) + (get_global_mouse_position() as Vector2i) - drag_start_position
		DisplayServer.window_set_position(new_position, window_id)
		pass
	
