extends Sprite

func _ready():
	get_node("AnimationPlayer").play("fade")
	yield(get_node("AnimationPlayer"), "animation_finished")
	queue_free()