# godot_neon
glow and animated neon effect

![Title](https://github.com/JDHunterZ/godot_neon/blob/master/_media/20200224_screen.png?raw=true "Title")

[![Samples Youtube](https://img.youtube.com/vi/Ly3TmzHI7ss/0.jpg)](https://www.youtube.com/watch?v=Ly3TmzHI7ss)
# Solution

## Glowing:
For the glowing effect i use the WorldEnvironment (on "Main.tscn")

see:
* "\environment\Glow_1920.tres"
 
properties: (a few important settings)
* "Background.Mode=Canvas"
* "Glow.Enabled=True"
* "Blend Mode.Screen"


## Animation:
For blinking animation i used the AnimationPlayer and manipulate the CanvasItem.Modulate.a (Alpha) of the current node

see:
* "\animation\..."


## Simple use:
I have created a text animation node that allows you to easily use neon-effect labels that are animated

see:
* "\scene\TextAnimation.gd"
* "\scene\TextAnimation.gd"

properties:
* "Text"
* "Custom Font"
* "Text Color" 
* "Animation Name"
* "Animation Speed"

# Sample
* start "\scene_sample\Main.tscn"
* use "SPACE"-key to load the next sample scene
* use "ESC"-key to exit


## Remark

has inspired me to (thanks)
https://www.reddit.com/r/godot/comments/f1eua2/my_own_startup_logo_1920x1080_link_in_the_comment/

Used:
https://commons.wikimedia.org/wiki/File:Godot_icon.svg

Helpful tutorial:
Godot Engine 3.0:How to make Glow effect in 2D with WorldEnvironment Node
https://www.youtube.com/watch?v=2d_bxuS_zwo
