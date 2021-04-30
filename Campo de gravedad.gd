extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var motion

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	position += motion * 500 * delta

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_AnimationPlayer_animation_finished(anim_name):
	queue_free()
