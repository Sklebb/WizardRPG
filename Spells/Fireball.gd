extends RigidBody2D

onready var sprite = $Sprite
onready var animatedSprite = $AnimatedSprite
onready var collisionShape = $CollisionShape2D
onready var hitbox = $FireballHitBox/CollisionShape2D
var hit = false


func _ready():
	self.set_gravity_scale(0)
	collisionShape.disabled = true;
	animatedSprite.visible = false;


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	if Input.is_action_just_pressed("ui_fire"):
#		play_fireball_effect()




func play_fireball_effect():
	if hit == false:
		animatedSprite.visible = true
		sprite.visible = false
		animatedSprite.frame = 0
	
		hitbox.disabled = true;
		animatedSprite.play("Animate")
	else:
		hit = true;
	


func _on_AnimatedSprite_animation_finished():
	queue_free()


func _on_FireballHitBox_area_entered(area):
	play_fireball_effect()
