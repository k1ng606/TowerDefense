extends Area2D

func _ready():
	connect("input_event", input_event_handler)
	
func input_event_handler(_viewport: Node, event: InputEvent, _shape_idx: int):
	if event is InputEventMouseButton and event.pressed and event.button_index == 1:
		self.queue_free()
		
