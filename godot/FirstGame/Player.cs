using Godot;

namespace FirstGame;

public partial class Player : RigidBody3D
{
    private float mouseSensitivity = 0.003f;
    private float twistInput;
    private float pitchInput;

    private Node3D twistPivot;
    private Node3D pitchPivot;

    // Called when the node enters the scene tree for the first time.
    public override void _Ready()
    {
        Input.MouseMode = Input.MouseModeEnum.Captured;
        twistPivot = (Node3D)GetNode("TwistPivot");
        pitchPivot = (Node3D)GetNode("TwistPivot/PitchPivot");
    }

    // Called every frame. 'delta' is the elapsed time since the previous frame.
    public override void _Process(double delta)
    {
        var input = Vector3.Zero;
        input.X = Input.GetAxis("move_left", "move_right");
        input.Z = Input.GetAxis("move_forward", "move_back");

        ApplyCentralForce(twistPivot.Basis * input * 1200 * (float)delta);

        if (Input.IsActionJustPressed("ui_cancel"))
            Input.MouseMode = Input.MouseModeEnum.Visible;

        twistPivot.RotateY(twistInput);
        pitchPivot.RotateX(pitchInput);
        pitchPivot.Rotation = new Vector3(Mathf.Clamp(pitchPivot.Rotation.X, -1, 1), 0, 0);

        twistInput = 0;
        pitchInput = 0;
    }

    public override void _UnhandledInput(InputEvent @event)
    {
        if (@event is InputEventMouseMotion eventMouseMotion)
            if (Input.MouseMode == Input.MouseModeEnum.Captured)
            {
                twistInput = -eventMouseMotion.Relative.X * mouseSensitivity;
                pitchInput = -eventMouseMotion.Relative.Y * mouseSensitivity;
            }
    }
}