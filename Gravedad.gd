extends Node2D

const initial_gravity = 40
var gravity = initial_gravity
var gravity_vector = Vector2(0, 1)
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func esta_de_cabeza():
	return gravity_vector.y == -1

func gravedad():
	return initial_gravity * gravity_vector.y

func y():
	return gravity_vector.y

func cambiar():
	gravity_vector *= -1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
