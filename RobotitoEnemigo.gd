extends KinematicBody2D

const speed = 150
const UP = Vector2(0,-1)
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var motion = Vector2(-speed, 0)
onready var sprite = $Sprite
var gravedad

# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprite.flip_h = true
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	efecto_gravitatorio()
	motion = move_and_slide(motion, UP)
	
func efecto_gravitatorio():
	motion.y = motion.y + gravedad.gravedad()
	sprite.flip_v = gravedad.esta_de_cabeza()
	
func tocaste_al_jugador(jugador):
	jugador.mori()

