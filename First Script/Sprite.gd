extends Sprite

var speed = 400
var angular_speed = PI

func _process(delta):
	var velocity = Vector2.UP.rotated(rotation) * speed
	
	position += velocity * delta
	rotation += angular_speed * delta
