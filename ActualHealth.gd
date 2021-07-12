extends ProgressBar

var boss

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(false)
	
func boss(_boss):
	boss = _boss

func perder_vida(vida_perdida):
	value = max(value - vida_perdida, min_value)
	$Timer.start()
	if(value == 0):
		boss.morir()
		
func tiene_vida():
	return value > 0

func _on_Timer_timeout():
	set_process(true)

func _process(delta):
	var damage = $DamageTaken.value
	$DamageTaken.value = lerp(damage, value, 0.1)
	if(damage - value <= 0.5):
		$DamageTaken.value = value
		set_process(false)
