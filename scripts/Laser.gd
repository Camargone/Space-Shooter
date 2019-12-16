extends Area2D

export var velocity = Vector2()
const scn_flare = preload("res://scenes/Flare.tscn")


func _ready():
	create_flare()
	
	yield(get_node("Vis_notifier"), "screen_exited")
	queue_free()
	pass
	
func _process(delta):
	translate(velocity * delta)
	pass
	

func create_flare():
	var flare = scn_flare.instance()
	flare.set_position(position)
	get_tree().get_root().add_child(flare)
	pass