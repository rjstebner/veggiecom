extends Node2D

# Declare the AbilityType enum
enum AbilityType { ATTACK, SKILL, SELF, AREA }  # Defined types
# Preload the Ability resource
var ability = preload("res://Abilities/Ability.gd")

func _ready():
	# Create a new ability
	var attack = ability.new()
	attack.name = "Attack"
	attack.description = "Deal damage to a single target."
	attack.type = AbilityType.ATTACK
	attack.cost = 1
	attack.icon = load("res://Basic.png")
	attack.abilityRange = 10
	attack.damage = 10
	attack.actions = ["deal_damage"]
	
	var user = $User
	var target = $Target

	# Add custom properties to the user and target for testing
	user.name = "Hero"

	
	target.name = "Enemy"
	target.is_enemy = true

	
	# Execute the ability
	attack.execute(user, target, null)
	
	print("Ability executed")
