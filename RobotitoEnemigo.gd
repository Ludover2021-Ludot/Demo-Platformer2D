extends KinematicBody2D

const speed = 150
const UP = Vector2(0,-1)
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var motion = Vector2(0, 0)
onready var sprite = $Sprite
var gravedad
var prendido = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if(prendido):
		efecto_gravitatorio()
		motion = move_and_slide(motion, UP)
	
func efecto_gravitatorio():
	motion.y = motion.y + gravedad.gravedad()
	sprite.flip_v = gravedad.esta_de_cabeza()
	
func tocaste_al_jugador(jugador):
	jugador.mori()

func prenderse():
	$Sprite.flip_h = true
	motion = Vector2(-speed, 0)
	prendido = true

func _on_Area_area_entered(area):
	self.prenderse()
