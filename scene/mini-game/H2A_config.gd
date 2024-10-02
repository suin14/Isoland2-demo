@tool
extends Resource
class_name H2AConfig


enum Slot { NULL, TIME, SUN, FISH, HIT, CROSS, CHOICE}

var placements := PackedInt32Array()
var connections := {}

func _init() -> void:
	placements.resize(Slot.size())
	placements.fill(Slot.NULL)
	
	for slot in Slot.values():
		connections[slot] = []


func _get_property_list() -> Array[Dictionary]:
	var properties := [
		{
			name="placements",
			type=TYPE_PACKED_INT32_ARRAY,
			usage=PROPERTY_USAGE_STORAGE
		},
		{
			name="connections",
			type=TYPE_DICTIONARY,
			usage=PROPERTY_USAGE_STORAGE
		}
	]
	
	var options := PackedStringArray(Slot.keys())
	#options = options.join(",")
	for slot in range(1, Slot.size()):
		properties.append({
			name="placements/" + Slot.keys()[slot],
			type=TYPE_INT,
			usage=PROPERTY_USAGE_EDITOR,
			hint=PROPERTY_HINT_ENUM,
			hint_strings="A,B",
			
		})
	
	return properties


func _get(property: StringName) -> Variant:
	return null


func _set(property: StringName, value: Variant) -> bool:
	return false
