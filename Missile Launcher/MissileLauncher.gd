extends Position2D

signal start

export (PackedScene) var Bullet

func launch() -> void:
	var dir = Vector2(1, 0).rotated(global_rotation)
	emit_signal("start", Bullet, global_position, dir)
