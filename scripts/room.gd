class_name Room
extends Resource

#Types of rooms in the game.
enum Type{ NOT_ASSIGNED, MONSTER, TREASURE, CAMPFIRE, SHOP, BOSS }

@export var type: Type
@export var row: int
@export var column: int
@export var position: Vector2
@export var next_rooms: Array[Room]
@export var selected := false

#The column and first letter of the type for debug purposes
func _to_string() -> String:
	return "%s (%s)" % [column, Type.keys()[type][0]]
