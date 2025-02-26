extends Resource
class_name Ability

enum AbilityType { ATTACK, SKILL, SELF, AREA }  # Defined types

# Variables that define the ability
@export var name : String
@export var description : String
@export var type : AbilityType
@export var cost : int
@export var icon : Texture
@export var abilityRange : int 

# Export individual effect values
@export var damage : int = 0
@export var heal : int = 0
@export var shove : int = 0
@export var buff : int = 0

# List of actions to perform
@export var actions : Array = []

var effect_values = {}

func _init():
    effect_values = {
        "damage": damage,
        "heal": heal,
        "shove": shove,
        "buff": buff
    }

#func select_target21(target1, target2, tilemap):
    # Implement target2 selection logic here
    # pass

# Executes the ability
func execute(target1, target2, tilemap):
    for action in actions:
        match action:
            "deal_damage":
                deal_damage(target1, target2)
            "heal":
                heal_target1(target1)
            "apply_buff":
                apply_buff(target1)
            "force_shove":
                force_shove(target1, target2)
            "move_to":
                move_to(target1, tilemap)
            _:
                print("Unknown action: ", action)

# Deal damage to the target2
func deal_damage(target1, target2):
    if target2 and "is_enemy" in target2 and target2.is_enemy:
        target2.take_damage(damage)
        print(target1.name, " attacked ", target2.name, " for ", damage, " damage!")

# Heal the target1
func heal_target1(target1):
    target1.heal(heal)
    print(target1.name, " healed for ", heal, " HP!")

# Apply a buff to the target1
func apply_buff(target1):
    target1.apply_buff(buff)
    print(target1.name, " applied a buff: ", buff)

# Shove the target2
func force_shove(target1, target2):
    target2.shove(shove)
    print(target1.name, " shoved ", target2.name, " for ", shove, " tiles!")

func move_to(target1, tilemap):
    # Move the target1 to the tilemap location
    print(target1.name, " moved to ", tilemap)
    # Add actual movement logic here