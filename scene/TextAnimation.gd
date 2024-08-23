@tool
extends Control

#@onready var animplayer: AnimationPlayer = $"%AnimationPlayer"

# what text should be shown
@export var text: String = "": get = get_text, set = set_text

# what font should the text have
@export var custom_font: Font = null: get = get_custom_font, set = set_custom_font

# what color should the text have
@export var text_color: Color = Color(1,1,1): get = get_text_color, set = set_text_color # (Color, RGB)

# what color should the text have
@export var text_size: int = 22: get = get_text_size, set = set_text_size # (Int, Size)

# what animation should be played
@export_enum("Stop", "Blinking01", "Blinking01_long", "Blinking02", "Blinking03", "Pulse01", "Pulse01_long", "Pulse02") var animation_name: String = "Stop" : get = get_animation_name, set = set_animation_name # (String, "Stop", "Blinking01", "Blinking01_long", "Blinking02", "Blinking03", "Pulse01", "Pulse01_long", "Pulse02")

# 
#export(float, 0, 10) var animation_offset = 0 setget set_animation_offset

# how fast should the animation be played
@export var animation_speed: float = 1.0: set = set_animation_speed


# Called when the node enters the scene tree for the first time.
func _ready():
	#now init and set all properties
	set_text(text)
	set_custom_font(custom_font)
	set_text_color(text_color)
	set_animation_name(animation_name)
	#set_animation_offset(animation_offset)
	set_animation_speed(animation_speed)
	#%Label.add_theme_font_size_override("font_size",)



func set_text(value):
	text = value
	if (has_node("Label")): # prevent the error when an instance of this node is created and the child nodes are not yet present
		$Label.text = value


func get_text():
	return $Label.text


func set_custom_font(value):
	custom_font = value
	if (has_node("Label")): # prevent the error when an instance of this node is created and the child nodes are not yet present
		$Label.add_theme_font_override("font", value)


func get_custom_font():
	return $Label.get_theme_font("font")


func set_text_color(value):
	text_color = value
	if (has_node("Label")): # prevent the error when an instance of this node is created and the child nodes are not yet present
		$Label.add_theme_color_override("font_color", value)


func get_text_color():
	return $Label.get_theme_color("font_color")


func set_text_size(value):
	text_size = value
	if (has_node("Label")): # prevent the error when an instance of this node is created and the child nodes are not yet present
		$Label.add_theme_font_size_override("font_size", value)


func get_text_size():
	return $Label.get_theme_font_size("font_size")
	

func set_animation_name(value):
	animation_name = value
	if (has_node("AnimationPlayer")): # prevent the error when an instance of this node is created and the child nodes are not yet present
		
		$AnimationPlayer.current_animation = value
		
		if (value == "Stop"):
			$AnimationPlayer.stop(true)
			
		


func get_animation_name():
	return $AnimationPlayer.current_animation


#func set_animation_offset(value):
#	animation_offset = value
#	if (has_node("AnimationPlayer")):
#		$AnimationPlayer.current_animation_position = value


func set_animation_speed(value):
	animation_speed = value
	if (has_node("AnimationPlayer")):
		$AnimationPlayer.speed_scale = value
