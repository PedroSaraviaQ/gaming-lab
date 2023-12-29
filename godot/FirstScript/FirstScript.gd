extends Sprite2D

#* "_init" is called when the node is created, if the function is defined.
func _init():
	print("Hello World!")

var speed = 400
var angular_speed = PI

#* "_process" is called every frame (60 times per second by default).
func _process(delta):

	#* "rotation" is a property inherited from Node2D.
	rotation += angular_speed * delta
	
	var velocity = Vector2.UP.rotated(rotation) * speed

	#! The "position" property is of type "Vector2".
	position += velocity * delta
