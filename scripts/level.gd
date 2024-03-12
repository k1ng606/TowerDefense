extends Node2D

@onready var tower_scene := preload("res://scenes/tower.tscn")
@onready var tower_button: Button = $"../Control/Panel/VBoxContainer/Button"
@onready var mouse_hover_tower_instance = preload("res://scenes/tower_preview.tscn").instantiate()
signal attempt_to_add_tower

func _ready():
	tower_button.connect("pressed", Callable(self, "pressed_handler"))
	connect("attempt_to_add_tower", Callable(self, "attempt_to_add_tower_handler"))
	
func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == 1 and Global.add_tower_mode:
		remove_child(mouse_hover_tower_instance)
		Global.add_tower_mode = false
		attempt_to_add_tower.emit()
	
func attempt_to_add_tower_handler():
	var tower_instance: Tower = tower_scene.instantiate()
	add_child(tower_instance)
	tower_instance.position = get_viewport().get_mouse_position()
	tower_instance.connect("area_entered", Callable(self, "area_entered_handler"))
	
func area_entered_handler(area: Area2D):
	if (area is Tower):
		area.queue_free()

func pressed_handler():
	#mouse_hover_tower_instance = mouse_hover_tower_instance.instantiate()
	add_child(mouse_hover_tower_instance)
	mouse_hover_tower_instance.modulate = Color.GREEN
	Global.add_tower_mode = true
	#Global.can_add_tower = true

func _process(_delta):
	mouse_hover_tower_instance.position = get_viewport().get_mouse_position()
	#get_viewport().get_mouse_position()
	#if (is_instance_valid(mouse_hover_tower_instance)):
		#print(mouse_hover_tower_instance)
		#print(is_instance_valid(mouse_hover_tower_instance))
		#mouse_hover_tower_instance.position = get_viewport().get_mouse_position()
	#if (Input.is_action_just_pressed("click")):
		#add_tower()

#func area_entered_handler(area: Area2D):
	#if (area is Tower):
		#print("area_entered_handler false")
		#Global.can_add_tower = false
		#in_other_tower_space = true
		#
#func area_exited_handler(area: Area2D):
	#if (area is Tower):
		#print("area_exited_handler true")
		#Global.can_add_tower = true
		
#func mouse_entered_handler():
	#print("mouse_entered_handler")
	#Global.can_add_tower = false
	#
#func mouse_exited_handler():
	#print("mouse_exited_handler")
	#Global.can_add_tower = true

#func add_tower():
	#if (Global.can_add_tower and Global.add_tower_mode):
		#var tower_instance: Tower = tower_scene.instantiate()
		#add_child(tower_instance)
		#tower_instance.connect("area_entered", Callable(self, "area_entered_handler"))
		#tower_instance.connect("area_exited", Callable(self, "area_exited_handler"))
		##tower_instance.connect("mouse_entered", Callable(self, "mouse_entered_handler"))
		##tower_instance.connect("mouse_exited", Callable(self, "mouse_exited_handler"))
		#tower_instance.position = get_viewport().get_mouse_position()
		#Global.can_add_tower = false
		#Global.add_tower_mode = false
		#remove_child(mouse_hover_tower_instance)
