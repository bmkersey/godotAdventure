extends Area2D

@export var is_single_use: bool = false
var bodies_on_top: int = 0
signal pressed
signal unpressed


func _on_body_entered(body: Node2D) -> void:
	bodies_on_top += 1
	if body.is_in_group("pushable") or body is Player:
		if bodies_on_top == 1:
			pressed.emit()
			print("I have been pushed")
			$AnimatedSprite2D.play("Pressed")


func _on_body_exited(body: Node2D) -> void:
	if is_single_use:
		return
	bodies_on_top -= 1
	if body.is_in_group("pushable") or body is Player:
		if bodies_on_top == 0:
			unpressed.emit()
			print("No longer pressed")
			$AnimatedSprite2D.play("Unpressed")
