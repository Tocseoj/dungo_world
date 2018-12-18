extends Node2D

export(int, "Box", "Box Broken", "Box Rubble", "Two Pots", "Pot", "Pot Broken") \
	var type = 0 setget type_set

func type_set(value):
	type = value
	if value == 2:
		$StaticBody2D/CollisionShape2D.disabled = true
	else:
		$StaticBody2D/CollisionShape2D.disabled = false
	
	if value == 2 or value >= 4:
		$Sprite.region_rect.size.y = 16
		$Sprite.position.y = 0
	else:
		$Sprite.region_rect.size.y = 32
		$Sprite.position.y = -8
	
	if value <= 1:
		$Sprite.region_rect.position.x =  272 + (value * 16)
		$Sprite.region_rect.position.y =  272
	elif value == 2:
		$Sprite.region_rect.position.x =  272 - (16) + (32)
		$Sprite.region_rect.position.y =  272 - 16
	elif value == 3:
		$Sprite.region_rect.position.x =  272 - (16)
		$Sprite.region_rect.position.y =  272
	elif value >= 4:
		$Sprite.region_rect.position.x =  272 - (16) + ((value - 4) * 16)
		$Sprite.region_rect.position.y =  272 - 16