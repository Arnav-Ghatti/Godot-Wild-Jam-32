extends KinematicBody2D

export(int) var move_speed = 170
export(int) var stop_pos = 16
var not_moving = false

signal player_dead

func _ready() -> void:
	Global.player = self

func _exit_tree() -> void:
	Global.player = null

func _process(delta: float) -> void:
	if Global.player_lives == 0:
		emit_signal("player_dead")
		Global.player = null
		set_process(false)
	
	_look_at_mouse()
	_go_to_mouse()
	
	if position.distance_to(get_global_mouse_position()) <= stop_pos:
		not_moving = true

func _look_at_mouse() -> void:
	look_at(get_global_mouse_position())
	rotation_degrees += 90

func _go_to_mouse() -> void:
	if position.distance_to(get_global_mouse_position()) > stop_pos:
		not_moving = false
		var direction = get_global_mouse_position() - position
		var normalized_direction = direction.normalized()
		move_and_slide(normalized_direction * move_speed)

func _on_MissileDetector_area_entered(area: Area2D) -> void:
	if area.is_in_group("missile"):
		$CollisionPolygon2D.disabled = true
		$Sprite.set_texture(load("res://Player/player_damage.png"))
		Global.player_lives -= 1
		$Cooldown.start()

func _on_Cooldown_timeout() -> void:
	$Sprite.set_texture(load("res://Player/player.png"))
