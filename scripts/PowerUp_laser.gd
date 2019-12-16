extends "res://scripts/PowerUp.gd"

func _ready():
	connect("area_entered", self, "_on_area_enter")
	pass

func _on_area_enter(other):
	if other.is_in_group("ship"):
		Audio_player.get_node("audio_powerup").play()
		other.is_double_shooting = true
		queue_free()