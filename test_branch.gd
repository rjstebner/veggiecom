extends Node2D

# Load the light attack resource using ResourceLoader
var light_attack = ResourceLoader.load("res://Abilities/BasicAbilities/lightAttack.tres")
var recover = ResourceLoader.load("res://Abilities/BasicAbilities/recover.tres")
var move = ResourceLoader.load("res://Abilities/BasicAbilities/move.tres")

func _ready():
    # Ensure the resources are loaded correctly
    if move:
        print("Move resource loaded")
    else:
        print("Failed to load move resource")

    if recover:
        print("Recover resource loaded")
    else:
        print("Failed to load recover resource")

    if light_attack:
        print("Light attack resource loaded")
    else:
        print("Failed to load light attack resource")

    # Connect button signals to functions
    $Control/zeroBTN.connect("pressed", Callable(self, "_on_zeroBTN_pressed"))
    $Control/oneBTN.connect("pressed", Callable(self, "_on_oneBTN_pressed"))
    $Control/twoBTN.connect("pressed", Callable(self, "_on_twoBTN_pressed"))

func _on_zeroBTN_pressed():
    var target1 = $User
    var tilemap = Vector2(0, 0)
    if move.has_method("execute"):
        move.execute(target1, null, tilemap)
        print("Move ability executed")

func _on_oneBTN_pressed():
    var target1 = $User
    if recover.has_method("execute"):
        recover.execute(target1, null, null)
        print("Recover ability executed")

func _on_twoBTN_pressed():
    var target1 = $User
    var target2 = $Target

    # Add custom properties to the target1 and target2 for testing
    target1.name = "Hero"
    target2.name = "Enemy"
    target2.is_enemy = true

    if light_attack.has_method("execute"):
        light_attack.execute(target1, target2, null)
        print("Light attack ability executed")