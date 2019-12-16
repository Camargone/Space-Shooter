extends Area2D

var armor = 4 setget set_armor
var is_double_shooting = false setget set_double_shooting
#var touch_left = false 
#var touch_right = false

const scn_laser = preload("res://scenes/Laser_ship.tscn")
const scn_explosion = preload("res://scenes/Explosion.tscn")
const scn_flash = preload("res://scenes/Flash.tscn")

signal armor_changed(new_armor)
signal back_to_menu()

func _ready():
	add_to_group("ship")
	
	#yield(get_tree().create_timer(0.5), "timeout")
	shoot()
	pass
	
	
func _process(delta):
	#var pos = position
	#pos.x = get_global_mouse_position().x
	#set_position(pos)
	
	var motion = (get_global_mouse_position().x - position.x) * 0.08  #  or touch_left or touch_right 
	translate(Vector2(motion, 0))
	
	var view_size = get_viewport_rect().size
	var pos = position
	pos.x = clamp(pos.x, 0+10, view_size.x-10)
	set_position(pos)
	pass
	
func shoot():
	while true:
		var pos_left = get_node("Cannons/Left").get_global_position()
		var pos_right = get_node("Cannons/Right").get_global_position()
		create_laser(pos_left)
		Audio_player.get_node("audio_laser_ship").play()
		create_laser(pos_right)
		Audio_player.get_node("audio_laser_ship").play()
		
		if is_double_shooting:
			var laser_left = create_laser(pos_left)
			Audio_player.get_node("audio_laser_ship").play()
			var laser_right = create_laser(pos_right)
			Audio_player.get_node("audio_laser_ship").play()
			laser_left.velocity.x = -25
			laser_right.velocity.x = 25 
		
		yield(get_tree().create_timer(0.25), "timeout")  #Rate of fire


func set_armor(new_value):
	if new_value > 4:
		return
	
	if new_value < armor:
		Audio_player.get_node("audio_armor_damage").play()
		get_tree().get_root().add_child(scn_flash.instance())
	
	armor = new_value
	emit_signal("armor_changed", armor) #Signal to change HP (Armor)
	if armor <= 0:
		emit_signal("back_to_menu")
		create_explosion()
		queue_free()

func set_double_shooting(new_value):
	is_double_shooting = new_value
	
	if is_double_shooting:
		yield(get_tree().create_timer(7), "timeout") #Time with double shooting active
		is_double_shooting = false

func create_laser(pos):
	var laser = scn_laser.instance()
	laser.set_position(pos)
	get_tree().get_root().add_child(laser)
	return laser ####
	
func create_explosion():
	var explosion = scn_explosion.instance()
	explosion.set_position(position)
	Audio_player.get_node("audio_explosions").play()
	get_tree().get_root().add_child(explosion)

