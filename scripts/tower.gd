extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	connect("input_event", input_event_handler)
	
func input_event_handler(_viewport: Node, event: InputEvent, _shape_idx: int):
	if event is InputEventMouseButton and event.pressed and event.button_index == 1:
		self.queue_free()
		
		#print(event)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
