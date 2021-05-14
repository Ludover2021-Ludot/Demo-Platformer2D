extends Sprite

const circunferencia = 80 * 3.1416
var old_pos

# Called when the node enters the scene tree for the first time.
func _ready():
	rotation_degrees = 0
	old_pos = self.get_position()


func te_moviste_a(new_pos, derecha):
	var distancia = new_pos.distance_to(old_pos)
	old_pos = new_pos
	var angulo = 360 * distancia / circunferencia

	if (derecha):
		rotation_degrees += angulo
	else:
		rotation_degrees -= angulo
	

