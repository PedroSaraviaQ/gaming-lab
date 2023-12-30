#* Every file is implicitly a class, use "extends" to inherit from another one.
extends Sprite2D

#* "_init" is called when the node is created, if the function is defined.
func _init():
	print("Hello World!")

#* Member variables are properties of the class, while functions are methods.
var speed = 400
var angular_speed = PI

#* "_process" is called every frame (60 times per second by default).
#* It takes a "delta" parameter, which is the time elapsed since the last frame.
func _process(delta):
	# var direction = 0

	#* Use the "Input" singleton (global object) to check for user input.
	#! But you can also define the "_unhandled_input" function to handle it.
	# if Input.is_action_pressed("ui_left"):
	# 	direction = -1
	# if Input.is_action_pressed("ui_right"):
	# 	direction = 1

	#* "rotation" is a property inherited from Node2D.
	# rotation += angular_speed * direction * delta
	rotation += angular_speed * delta

	# var velocity = Vector2.ZERO
	# if Input.is_action_pressed("ui_up"):
	# 	velocity = Vector2.UP.rotated(rotation) * speed

	var velocity = Vector2.UP.rotated(rotation) * speed

	#! The "position" property is of type "Vector2".
	position += velocity * delta

#* This is a signal, it will be emitted when the button is clicked.
#? For this to work, we have commented out some lines of code.
func _on_button_pressed():
	set_process(not is_processing())
