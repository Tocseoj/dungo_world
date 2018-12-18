extends Node2D

export(int, "Closed", "Open") \
	var type = 0 setget type_set

func type_set(value):
	type = value
	if   value == 0: # Closed
		$StaticBody2D.set_collision_layer_bit(0, true)
		$StaticBody2D.set_collision_mask_bit(0, true)
	elif value == 1: # Open
		$StaticBody2D.set_collision_layer_bit(0, false)
		$StaticBody2D.set_collision_mask_bit(0, false)
	$Sprite.region_rect.position.x = 224 + (value * 16)

func interact():
	if type == 0:
		type_set(1)
	elif type == 1:
		type_set(0)