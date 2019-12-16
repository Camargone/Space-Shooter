extends Node

const powerup_armor = preload("res://scenes/PowerUp_armor.tscn")
const powerup_laser = preload("res://scenes/PowerUp_laser.tscn")

func _ready():
	randomize()
	yield(get_tree().create_timer(rand_range(7, 15)), "timeout")
	Spawn()
	Spawn2()
	
	
func Spawn():
	while true:
		var powerup = powerup_armor.instance()
		var pos = Vector2()
		pos.x = rand_range(0+16, get_viewport().get_visible_rect().size.x-7)
		pos.y = 0-7
		powerup.set_position(pos)
		get_node("Container").add_child(powerup)
		yield(get_tree().create_timer(rand_range(10, 13)), "timeout")


func Spawn2():
	while true:
		var powerup = powerup_laser.instance()
		var pos = Vector2()
		pos.x = rand_range(0+16, get_viewport().get_visible_rect().size.x-16)
		pos.y = 0-16
		powerup.set_position(pos)
		get_node("Container").add_child(powerup)
		yield(get_tree().create_timer(rand_range(13, 17)), "timeout")