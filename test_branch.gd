extends Node2D

# Load the light attack resource using ResourceLoader
var light_attack = ResourceLoader.load("res://Abilities/BasicAbilities/lightAttack.tres")
var recover = ResourceLoader.load("res://Abilities/BasicAbilities/recover.tres")
var move = ResourceLoader.load("res://Abilities/BasicAbilities/move.tres")

func _ready():
    # Ensure the resource is loaded correctly

    if move:
        print("Move resource loaded")
        var target1 = $User
        var tilemap = Vector2(0, 0)
        
        if move.has_method("execute"):
            move.execute(target1, null, tilemap)
            print("Ability executed")
    else:
        print("Failed to load move resource")


    if recover:
        var target1 = $User

        recover.execute(target1, null, null)
        print("Ability executed")
    else:
        print("Failed to load recover resource")

    if light_attack:
        var target1 = $User
        var target2 = $Target

        # Add custom properties to the target1 and target2 for testing
        target1.name = "Hero"
        target2.name = "Enemy"
        target2.is_enemy = true

        # Execute the ability
        light_attack.execute(target1, target2, null)
        
        print("Ability executed")
    else:
        print("Failed to load light attack resource")