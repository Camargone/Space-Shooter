extends Sprite

func _ready():
	get_node("CanvasModulate/Animation_Flare").play("fade_out")
	yield(get_node("CanvasModulate/Animation_Flare"), "animation_finished")
	queue_free()
	pass