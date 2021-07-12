extends "res://nivel.gd"


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var Explosion = preload("res://Explosion.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	$Jugador/Camera2D.zoom *= 2
	$Jugador/Camera2D.limit_top = -400
	$Jugador/Camera2D.limit_bottom = 800
	
func spawn_robotito(robotito):
	personajes_spawneados.push_back(robotito)
	self.add_child(robotito)
	
func despawn_robotito(robotito):
	personajes_spawneados.erase(robotito)
	self.remove_child(robotito)
	
func spawn_explosion_en(posicion):
	var explosion = Explosion.instance()
	explosion.position = posicion
	explosion.cambiar_nivel(self)
	self.add_child(explosion)
	explosion.connect("animation_finished", self, "_on_Explosion_animation_finished")
	explosion.play("Explosion")

func _on_Explosion_animation_finished(explosion):
	explosion.stop()
	self.remove_child(explosion)
	explosion.queue_free()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
