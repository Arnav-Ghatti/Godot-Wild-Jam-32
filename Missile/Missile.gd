extends Area2D

export (int) var speed
export (float) var steer_force

var velocity = Vector2.ZERO
var acceleration = Vector2.ZERO
var target = null

var explosion = preload("res://Particles/Explosion.tscn")

func start(_position, _direction, _target=null) -> void:
	position = _position
	rotation = _direction.angle()
	velocity = _direction * speed
	target = _target

func seek() -> float:
	var desired = (target.position - position).normalized() * speed
	var steer = (desired - velocity).normalized() * steer_force
	return steer

func _process(delta: float) -> void:
	if target:
		acceleration += seek()
		velocity += acceleration * delta
		velocity = velocity.clamped(speed)
		rotation = velocity.angle()
	
	position += velocity * delta

func _on_Missile_area_entered(area: Area2D) -> void:
	if area.is_in_group("missile"):
		area.queue_free()
