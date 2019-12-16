extends Sprite

func _ready():
	randomize()
	set_rotation(deg2rad(rand_range(0,360)))
	
	get_node("p_smoke").set_emitting(true)
	get_node("p_flare").set_emitting(true)
	
	get_node("/root/World/Camera2D").shake(8, 0.2)    
	
	get_node("AnimationPlayer").play("fade")
	yield(get_node("AnimationPlayer"), "animation_finished")  # 'animation_finished' works, unlike 'finished'
	queue_free()
	pass