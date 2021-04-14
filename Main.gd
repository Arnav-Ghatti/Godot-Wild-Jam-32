extends Node2D

func _ready() -> void:
	$MissileLauncher.launch()

func _on_Missile_Launch(bullet, _position, _direction):
	var m = bullet.instance()
	call_deferred("add_child", m)
	m.start(_position, _direction, $Player)
