/// @DnDAction : YoYo Games.Movement.Set_Direction_Point
/// @DnDVersion : 1
/// @DnDHash : 7944371E
/// @DnDArgument : "x" "oPlayer.x"
/// @DnDArgument : "y" "oPlayer.y-40"
direction = point_direction(x, y, oPlayer.x, oPlayer.y-40);

/// @DnDAction : YoYo Games.Movement.Set_Speed
/// @DnDVersion : 1
/// @DnDHash : 032D6A73
/// @DnDArgument : "speed" "0.2"
/// @DnDArgument : "speed_relative" "1"
speed += 0.2;

/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 0AC86430
/// @DnDArgument : "var" "abs(x-oPlayer.x)"
/// @DnDArgument : "op" "1"
/// @DnDArgument : "value" "30"
if(abs(x-oPlayer.x) < 30)
{
	/// @DnDAction : YoYo Games.Common.If_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 4E83B6E4
	/// @DnDParent : 0AC86430
	/// @DnDArgument : "var" "abs(y-(oPlayer.y-40))"
	/// @DnDArgument : "op" "1"
	/// @DnDArgument : "value" "30"
	if(abs(y-(oPlayer.y-40)) < 30)
	{
		/// @DnDAction : YoYo Games.Instances.Destroy_Instance
		/// @DnDVersion : 1
		/// @DnDHash : 67667503
		/// @DnDParent : 4E83B6E4
		instance_destroy();
	}
}