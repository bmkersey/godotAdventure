extends StaticBody2D

@export var chest_name: String
var can_interact: bool = false
var is_open: bool = false

func _ready() -> void:
	if SceneManager.opened_chests.has(chest_name):
		is_open = true
		$AnimatedSprite2D.play("open")

func _process(delta):
	if Input.is_action_just_pressed("interact") and can_interact:
		if not is_open:
			open_chest()


func open_chest():
	is_open = true
	$AnimatedSprite2D.play("open")
	$Sprite2D.visible = true
	$Timer.start()
	SceneManager.opened_chests.append(chest_name)
	print(SceneManager.opened_chests)

func _on_timer_timeout() -> void:
	$Sprite2D.visible = false 
