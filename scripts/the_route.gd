extends Node2D

@export var wait = 1
@export var speed = 300


# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.wait_time = wait
	$Timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	for _i in $Path2D.get_children():
		_i.progress += speed*delta
		_i.global_rotation = 0

func _on_timer_timeout():
	var spawn = preload("res://scenes/character.tscn").instantiate()
	$Path2D.add_child(spawn)
