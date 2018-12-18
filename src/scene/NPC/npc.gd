extends KinematicBody2D

# Declare member variables here. Examples:
const SPEED = 16 # pixels
var left_vec = Vector2(-1, 0) * SPEED
var right_vec = Vector2(1, 0) * SPEED
var up_vec = Vector2(0, -1) * SPEED
var down_vec = Vector2(0, 1) * SPEED

onready var prev_dir = down_vec

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	# Handle directional movement
	if Input.is_action_just_pressed("left"): 
		prev_dir = left_vec
		$RayCastPivot.rotation = prev_dir.angle()
		if not test_move(self.transform, left_vec):
			translate(left_vec)
	elif Input.is_action_just_pressed("right"):
		prev_dir = right_vec
		$RayCastPivot.rotation = prev_dir.angle()
		if not test_move(self.transform, right_vec):
			translate(right_vec)
	elif Input.is_action_just_pressed("up"): 
		prev_dir = up_vec
		$RayCastPivot.rotation = prev_dir.angle()
		if not test_move(self.transform, up_vec):
			translate(up_vec)
	elif Input.is_action_just_pressed("down"):
		prev_dir = down_vec
		$RayCastPivot.rotation = prev_dir.angle()
		if not test_move(self.transform, down_vec):
			translate(down_vec)
	
	if Input.is_action_just_pressed("interact"):
		_interact_with_object(prev_dir)

func _interact_with_object(dir):
	if $RayCastPivot/RayCast2D.is_colliding():
		var obj = $RayCastPivot/RayCast2D.get_collider()
		if obj.has_method("interact"):
			obj.interact()

	