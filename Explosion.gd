extends AnimatedSprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var nivel


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func cambiar_nivel(_nivel):
	self.nivel = _nivel


func _on_Explosion_animation_finished():
	nivel._on_Explosion_animation_finished(self)
