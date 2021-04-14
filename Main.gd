extends Node2D

onready var right_launcher = get_node("MissileLaunchers/Right")
onready var left_launcher = get_node("MissileLaunchers/Left")
onready var up_launcher = get_node("MissileLaunchers/Up")
onready var down_launcher = get_node("MissileLaunchers/Down")

func launch_missile(bullet, _position, _direction) -> void:
	var m = bullet.instance()
	call_deferred("add_child", m)
	m.start(_position, _direction, $Player)

func _on_LaunchTimer_timeout() -> void:
	var rand_num = round(rand_range(1, 4))
	if rand_num == 1:
		right_launcher.launch()
	elif rand_num == 2:
		left_launcher.launch()
	elif rand_num == 3:
		up_launcher.launch()
	else:
		down_launcher.launch()

func _on_Right_start(bullet, _position, _direction) -> void:
	launch_missile(bullet, _position, _direction)

func _on_Left_start(bullet, _position, _direction) -> void:
	launch_missile(bullet, _position, _direction)

func _on_Up_start(bullet, _position, _direction) -> void:
	launch_missile(bullet, _position, _direction)

func _on_Down_start(bullet, _position, _direction) -> void:
	launch_missile(bullet, _position, _direction)
