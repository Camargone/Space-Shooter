extends "res://scripts/Enemy.gd"

const scn_laser = preload("res://scenes/Laser_enemyA.tscn")

func _ready():
	randomize()
	shoot()
	velocity.x = rand_range(0+16, get_viewport().get_visible_rect().size.x-16)

func _process(delta):
	if position.x <= 0+16:
		velocity.x = abs(velocity.x)
	if position.x >= get_viewport().get_visible_rect().size.x-16:
		velocity.x = -abs(velocity.x)

func shoot():
	while true:
		#laser.set_position(get_node("Cannon").get_global_position())
		var pos = get_node("Cannon").get_global_position()
		create_laser(pos)
		Audio_player.get_node("audio_laser_enemy").play()
		yield(get_tree().create_timer(1.5), "timeout")

func create_laser(pos):
	var laser = scn_laser.instance()
	laser.set_position(pos)
	get_tree().get_root().add_child(laser)
	pass