# Bullet Help 

**V 1.0**

Created by: Aaron Reamer

------

​	Create bullet patterns through the scene dock which helps with developing games that are part of or borrow from the bullet hell genre. You can modify the behaviors of bullets and bullet spawners through the scene dock by attaching nodes which implement specific behaviors.

​	This module has not been made with Godot 4.0 in mind.

## Installation

​	Download or clone Bullet Help. Move the `addons/` folder into your project. If you already have an addons folder then simply copy the contents of this addons folder into your own.

​	You can find out more on the Godot [official documentation page](https://docs.godotengine.org/en/stable/tutorials/plugins/editor/installing_plugins.html).

## Usage

​	All scripts included in this addon are commented as a form of inline documentation. The most important information is at the top of each script file. The rest of this document will give you a general overview so you can get an idea of how to use Bullet Help. Open the script file and read the comments to understand a script's functionality.

​	You can utilize each script by either creating a node 2d and attaching the relevant script or by creating the node directly since each relevant script is its own class.

​	Each of the following categories within this project exist within their own folders.

### Bullets

​	To create a bullet scene simply attach one of the scripts in bullet folder onto a node2D. Modify and attach other nodes as you see fit.

### Bullet Mods

​	These add extra behaviors to a bullet. To apply a mod to a bullet you simply need to add a node2D as a child to the bullet and attach a bullet mod script to that node.

### Spawners

​	To use a spawner simply attach a spawner script to a node2D. The spawners on their most basic level require you to attach a bullet scene to an export variable as the bullet to fire. To actually fire bullets you need to call the `fire()` function within the spawner. The recommended way to do this is to have a timer emit a signal to call the function so that the spawner fires periodically as is typical with a bullet hell. 

### Spawner Mods

​	These add extra behaviors to a spawner. To apply a mod to a spawner you simply need to add a node2D as a child to the spawner and attach a spawner mod script to that node. These mods will also affect child spawners.

### Bullet Properties

​	Bullet properties are one of this addon's more complex features. You attach them like you would a bullet mod, but they behave a little differently. Attach bullet mods as children to the bullet property and it will modify the bullet property just like how that mod would modify it like the velocity of a bullet.

Example: Attach `property_scale.gd` to a child node2D of a bullet. Attach `mod_linear_accelerate.gd` to a child nod2D of that bullet property node. The bullet will now grow or shrink continuously.

## Tips

- To give spawners some interesting movement behaviors, try attaching a spawner to a bullet node and applying mods to the bullet node.
- You can attach bullets as children of other bullets to create some seriously crazy patterns.