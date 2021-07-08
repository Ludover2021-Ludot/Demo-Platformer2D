extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export(Array, NodePath) var elementos_afectados

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_area_entered(area):
	for elemento in elementos_afectados:
		get_node(elemento).toggle()
