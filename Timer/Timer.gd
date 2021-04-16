extends Label

var ms = 0
var sec = 0
var mins = 0

signal next_wave

func _process(delta: float) -> void:
	if ms > 9:
		ms = 0
		sec += 1
	
	if sec > 59:
		sec = 0
		mins += 1
	
	set_text(str(mins) + ":" + str(sec) + ":" + str(ms))

	if get_text() == Global.wave_end_text:
		emit_signal("next_wave")
		$ms.stop()

func _on_ms_timeout() -> void:
	ms += 1