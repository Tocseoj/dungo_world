extends Node2D

export(int, "Throne", "Stool") var chair_type = 0 setget type_set

func type_set(value):
	chair_type = value
	if value == 0: #Throne
		$Sprite.region_rect.size.y = 32
		$Sprite.region_rect.position.y =  256
		$Sprite.position.y = -8
	elif value == 1: #Stool
		$Sprite.region_rect.size.y = 16
		$Sprite.region_rect.position.y =  256 + 16*2
		$Sprite.position.y = 0