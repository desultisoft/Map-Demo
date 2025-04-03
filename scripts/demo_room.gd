extends Node2D

func _on_button_pressed():
	Events.on_room_completed.emit()
