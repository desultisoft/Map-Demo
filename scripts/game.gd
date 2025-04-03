extends Node2D

const DEMO_ROOM := preload("res://scenes/demo_room.tscn")

@onready var map = $Map
@onready var current_view = $CurrentView

# Called when the node enters the scene tree for the first time.
func _ready():
	Events.on_room_completed.connect(_finish_floor)
	Events.room_entered.connect(_move_to_room)
	map.generate_new_map()
	map.unlock_floor(0)
	
func _finish_floor():
	if(current_view.get_child_count() > 0):
		current_view.get_child(0).queue_free()
	map.show_map()
	map.unlock_next_rooms()

func _load_view(scene: PackedScene) -> Node:
	if(current_view.get_child_count() > 0):
		current_view.get_child(0).queue_free()
	get_tree().paused = false
	var new_view := scene.instantiate()
	current_view.add_child(new_view)
	return new_view

func _move_to_room(_room : Room):
	map.hide_map()
	#Check Room Type and load whatever scene you want.
	_load_view(DEMO_ROOM)
