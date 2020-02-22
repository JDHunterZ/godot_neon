tool
extends Control

# what text should be shown
export (String) var text = "" setget set_text, get_text

# what font should the text have
export (Font) var custom_font = null setget set_custom_font, get_custom_font

# what color should the text have
export (Color, RGB) var text_color = Color(1,1,1) setget set_text_color, get_text_color

# what animation should be played
export(String, "Stop", "Blinking01", "Blinking01_long", "Blinking02", "Blinking03", "Pulse01", "Pulse01_long", "Pulse02") var animation_name setget set_animation_name, get_animation_name

# 
#export(float, 0, 10) var animation_offset = 0 setget set_animation_offset

# how fast should the animation be played
export(float, -10, 10) var animation_speed = 1 setget set_animation_speed


# Called when the node enters the scene tree for the first time.
func _ready():
	#now init and set all properties
	set_text(text)
	set_custom_font(custom_font)
	set_text_color(text_color)
	set_animation_name(animation_name)
	#set_animation_offset(animation_offset)
	set_animation_speed(animation_speed)



func set_text(value):
	text = value
	if (has_node("Label")): # prevent the error when an instance of this node is created and the child nodes are not yet present
		$Label.text = value


func get_text():
	return $Label.text


func set_custom_font(value):
	custom_font = value
	if (has_node("Label")): # prevent the error when an instance of this node is created and the child nodes are not yet present
		$Label.add_font_override("font", value)


func get_custom_font():
	return $Label.get_font("font")


func set_text_color(value):
	text_color = value
	if (has_node("Label")): # prevent the error when an instance of this node is created and the child nodes are not yet present
		$Label.add_color_override("font_color", value)


func get_text_color():
	return $Label.get_color("font_color")


func set_animation_name(value):
	animation_name = value
	if (has_node("AnimationPlayer")): # prevent the error when an instance of this node is created and the child nodes are not yet present
		if (value == "Stop"):
			$AnimationPlayer.stop(true)
		else:
			$AnimationPlayer.current_animation = value


func get_animation_name():
	return $AnimationPlayer.current_animation


#func set_animation_offset(value):
#	animation_offset = value
#	if (has_node("AnimationPlayer")):
#		$AnimationPlayer.current_animation_position = value


func set_animation_speed(value):
	animation_speed = value
	if (has_node("AnimationPlayer")):
		$AnimationPlayer.playback_speed = value

