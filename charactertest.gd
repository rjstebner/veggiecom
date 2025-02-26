extends Sprite2D

var is_enemy = false

func heal(amount):
	print(name, " healed for ", amount, " HP")

func take_damage(amount):
	print(name, " took ", amount, " damage")

func apply_buff(amount):
	print(name, " applied a buff: ", amount)

func shove(amount):
	print(name, " shoved for ", amount, " tiles")
