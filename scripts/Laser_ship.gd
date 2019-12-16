extends "res://scripts/Laser.gd"

func _ready():
	connect("area_entered", self, "_on_area_enter")
	pass
	
func _on_area_enter(other):
	if other.is_in_group("enemy"):
		other.armor -= 1
		Audio_player.get_node("audio_hit").play()
		create_flare()
		get_node("/root/World/Camera2D").shake(1, 0.13)
		queue_free()