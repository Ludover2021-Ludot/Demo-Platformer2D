extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var current_summon_cd = 0
const summon_cd = 5

var direccion = 1

onready var animation = $AnimationPlayer
onready var Robotito = preload("res://Robotito.tscn")
	
	
func disminuir_cd_summon(delta):
	current_summon_cd = max(0, current_summon_cd - delta)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.disminuir_cd_summon(delta)
	if self.puedo_summonear():
			self.crear_robotito()
			current_summon_cd = summon_cd
		
func puedo_summonear():
	return current_summon_cd <= 0

func crear_robotito():
		var robotito = Robotito.instance()
		robotito.position = Vector2(position.x + 300 * direccion, position.y)
		robotito.prenderse()
		get_tree().get_current_scene().spawn_robotito(robotito)
		
func sufrir_danio():
	animation.play("SufrirDanio")

func _on_AnimationPlayer_animation_finished(anim_name):
	if(anim_name == "SufrirDanio"):
		animation.play("idle")
