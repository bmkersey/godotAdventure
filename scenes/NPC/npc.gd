extends StaticBody2D

var can_interact: bool = false
@export var dialogue_lines: Array[String] = ["Hello", "What", 'YEAH']
var dialogue_index: int = 0



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("interact") and can_interact:
		if dialogue_index < dialogue_lines.size():
			$CanvasLayer.visible = true
			get_tree().paused = true
			$CanvasLayer/Dialog.text = dialogue_lines[dialogue_index]
			dialogue_index += 1
		else:
			$CanvasLayer.visible = false
			get_tree().paused = false
			dialogue_index = 0
