extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var abierta = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func toggle():
	if(abierta):
		$AnimationPlayer.play_backwards("Abrirse")
	else:
		$AnimationPlayer.play("Abrirse")
	abierta = !abierta

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
