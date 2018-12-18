extends Node2D

export(int, "Empty", "Broken", "Full 1", "Full 2", "Empty Bin", "Full Bin 1", "Full Bin 2") \
	var shelf_type = 0 setget type_set

func type_set(value):
	shelf_type = value
	if   value <= 3:
		$Sprite.region_rect.position.x = 176 + (value * 32)
		$Sprite.region_rect.position.y = 192
	elif value >= 4:
		$Sprite.region_rect.position.x = 176 + (value * 32)
		$Sprite.region_rect.position.y = 192 + 32