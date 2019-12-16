extends Area2D

export var armor = 2 setget set_armor
export var velocity = Vector2()
export var score_value = 15

const scn_explosion = preload("res://scenes/Explosion.tscn")

func _ready():
	add_to_group("enemy")
	connect("area_entered", self, "_on_area_enter")
	
func _process(delta):
	translate(velocity * delta)
	
	if position.y >= get_viewport_rect().size.y+16:
		queue_free()
	pass

func _on_area_enter(other):
	if other.is_in_group("ship"):
		other.armor -= 1 
		queue_free()


func set_armor(new_value):
	if is_queued_for_deletion():
		return
	armor = new_value
	
	if armor <= 0: 
		get_node("/root/World/HUD/Texture_score").score += score_value
		create_explosion()
		queue_free()
		

func create_explosion():
	var explosion = scn_explosion.instance()
	explosion.set_position(position)
	Audio_player.get_node("audio_explosions").play()
	get_tree().get_root().add_child(explosion)

