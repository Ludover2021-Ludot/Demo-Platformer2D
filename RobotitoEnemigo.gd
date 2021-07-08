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

onready var Gravedad = preload("res://Gravedad.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	gravedad = Gravedad.instance()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if(prendido):
		efecto_gravitatorio()
		motion = move_and_slide(motion, UP)
		chequear_si_esta_tocando_pinches()
	
func efecto_gravitatorio():
	motion.y = motion.y + gravedad.gravedad()
	sprite.flip_v = gravedad.esta_de_cabeza()
	
func tocaste_al_jugador(jugador):
	jugador.mori()

func rotar():
	motion = Vector2(speed, 0)
	$Sprite.flip_h = false

func chequear_si_esta_tocando_pinches():
	var slide_count = get_slide_count()
	if slide_count:
		var collision = get_slide_collision(slide_count - 1)
		var danger = collision.collider.is_in_group("Danger")
		if(danger):
			mori()

func mori():
	queue_free()

func prenderse():
	if(!prendido):
		$Sprite.flip_h = true
		motion = Vector2(-speed, 0)
		prendido = true

func _on_Area_area_entered(area):
	area.chocasteConRobot(self)
	
func invertirGravedad():
	gravedad.cambiar()
