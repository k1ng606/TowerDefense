class_name Tower
extends Area2D

#signal space_occuppied

func _ready():
	pass
	#connect("input_event", input_event_handler)
	#connect("area_entered", area_entered_handler)
	#connect("check_if_can_add_tower", check_if_can_add_tower_handler)
	
#func input_event_handler(_viewport: Node, event: InputEvent, _shape_idx: int):
	#if event is InputEventMouseButton and event.pressed and event.button_index == 1:
		#print("I am a tower")
		

#func check_if_can_add_tower_handler():
	#print("check_if_can_add_tower_handler")

#func area_entered_handler(area: Area2D):
	#if (area is Tower):
		#print("I am a tower")
		#space_occuppied.emit()
