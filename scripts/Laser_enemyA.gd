extends "res://scripts/Laser.gd"

func _ready():
	connect("area_entered", self, "_on_area_enter")
	pass
	
func _on_area_enter(other):
	if other.is_in_group("ship"):
		other.armor -= 1
		create_flare()
		get_node("/root/World/Camera2D").shake(3, 0.13)    
		queue_free()