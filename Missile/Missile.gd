extends Area2D

export (int) var speed
export (float) var steer_force

var velocity = Vector2.ZERO
var acceleration = Vector2.ZERO
var target = null

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
	if Global.player != null:
		if target:
			acceleration += seek()
			velocity += acceleration * delta
			velocity = velocity.clamped(speed)
			rotation = velocity.angle()
		
		position += velocity * delta

func _on_Missile_area_entered(area: Area2D) -> void:
	if area.is_in_group("missile"):
		set_process(false)
		$Explosion.emitting = true
		$ExplosionRemove.start()

func _on_ExplosionRemove_timeout() -> void:
	queue_free()
