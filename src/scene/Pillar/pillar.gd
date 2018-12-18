extends Node2D

export(int, "Gray Torch", "Brown Torch", "Gray Full", \
	"Gray Broken", "Brown Full", "Brown Broken") \
	var pillar_type = 0 setget type_set

func type_set(value):
	pillar_type = value
	$Sprite.region_rect.position.x = 80 + (value * 16)