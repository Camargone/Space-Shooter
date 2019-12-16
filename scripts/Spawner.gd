extends Node

const enemy_kamikaze = preload("res://scenes/Enemy_kamikaze.tscn")
const enemy_clever = preload("res://scenes/Enemy_clever.tscn")

func _ready():
	randomize()
	Spawn()
	Spawn2()
	pass
	
	
func Spawn():
	while true:
		var enemy = enemy_kamikaze.instance()
		var pos = Vector2()
		pos.x = rand_range(0+16, get_viewport().get_visible_rect().size.x-16)
		pos.y = 0-16
		enemy.set_position(pos)
		get_node("Container").add_child(enemy)
		yield(get_tree().create_timer(rand_range(1, 3)), "timeout")
	pass
	

func Spawn2():
	while true:
		var enemy2 = enemy_clever.instance()
		var pos = Vector2()
		pos.x = rand_range(0+16, get_viewport().get_visible_rect().size.x-16)
		pos.y = 0-16
		enemy2.set_position(pos)
		get_node("Container").add_child(enemy2)
		yield(get_tree().create_timer(rand_range(0.2, 2.5)), "timeout")
	pass
