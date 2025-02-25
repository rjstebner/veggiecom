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

func select_target(user, target, tilemap):
    # Implement target selection logic here
    pass

# Executes the ability
func execute(user, target, _tilemap):
    for action in actions:
        match action:
            "deal_damage":
                deal_damage(user, target)
            "heal":
                heal_user(user)
            "apply_buff":
                apply_buff(user)
            "force_shove":
                force_shove(user, target)
            _:
                print("Unknown action: ", action)

# Deal damage to the target
func deal_damage(user, target):
    if target and "is_enemy" in target and target.is_enemy:
        var damage_amount = effect_values.get("damage", 0)
        target.take_damage(damage_amount)
        print(user.name, " attacked ", target.name, " for ", damage, " damage!")

# Heal the user
func heal_user(user):
    var heal_amount = effect_values.get("heal", 0)
    user.heal(heal_amount)
    print(user.name, " healed for ", heal_amount, " HP!")

# Apply a buff to the user
func apply_buff(user):
    var buff_amount = effect_values.get("buff", 0)
    user.apply_buff(buff_amount)
    print(user.name, " applied a buff: ", buff_amount)

# Shove the target
func force_shove(user, target):
    var shove_amount = effect_values.get("shove", 0)
    target.shove(shove_amount)
    print(user.name, " shoved ", target.name, " for ", shove_amount, " tiles!")