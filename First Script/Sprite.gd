extends Sprite

signal health_changed(old_value, new_value)
signal health_depleted

var health = 10
var speed = 400
var angular_speed = PI


func _ready():
	var timer = get_node("Timer")
	timer.connect("timeout", self, "_on_Timer_timeout")


func _process(delta):
	rotation += angular_speed * delta
	var velocity = Vector2.UP.rotated(rotation) * speed
	position += velocity * delta


func _on_Button_pressed():
	set_process(not is_processing())

func _on_Timer_timeout():
	visible = not visible


func take_damage(amount):
	var old_health = health
	health -= amount
	emit_signal("health_changed", old_health, health)
	if health <= 0:
		emit_signal("health_depleted")
