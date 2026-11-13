const std = @import("std");
const rl = @import("raylib");

// Cameras are controlled with combination of two: Look + Move
// Free Camera : FreeLook + FreeMove
// First Person Camera: FirstPersonLook(FreeLook with Constraint) + (SetCameraPosition + RightAxisRotationOnly)


pub const CameraInputKey = struct {
    move_forward: rl.KeyboardKey = .w,
    move_backward: rl.KeyboardKey = .s,
    strafe_left: rl.KeyboardKey = .a,
    strafe_right: rl.KeyboardKey = .d,
    jump: rl.KeyboardKey = .space,
    crouch: rl.KeyboardKey = .left_control,

    pub fn getInputForward(self: CameraInputKey) f32 {
        var forward_value: f32 = 0;
        if (rl.isKeyDown(self.move_forward)) forward_value += 1;
        if (rl.isKeyDown(self.move_backward)) forward_value -= 1;
        return forward_value;
    }
    
    pub fn getInputRight(self: CameraInputKey) f32 {
        var right_value: f32 = 0;
        if (rl.isKeyDown(self.strafe_left)) right_value -= 1;
        if (rl.isKeyDown(self.strafe_right)) right_value += 1;
        return right_value;
    }
    
    pub fn getInputUp(self: CameraInputKey) f32 {
        var up_value: f32 = 0;
        if (rl.isKeyDown(self.jump)) up_value += 1;
        if (rl.isKeyDown(self.crouch)) up_value -= 1;
        return up_value;
    }
};

pub const CameraInputMouseMotion = struct {
    m_pitch: f32 = 0.022,
    m_yaw: f32 = 0.022,
    sensitivity: f32 = 1.0,

    pub fn getPitchRadDelta(self: CameraInputMouseMotion) f32 {
        const pitch_delta = -rl.getMouseDelta().y * self.m_pitch * self.sensitivity;
        return std.math.degreesToRadians(pitch_delta);
    }

    pub fn getYawRadDelta(self: CameraInputMouseMotion) f32 {
        const yaw_delta = -rl.getMouseDelta().x * self.m_yaw * self.sensitivity;
        return std.math.degreesToRadians(yaw_delta);
    }
};

pub fn cameraFreeMove(
    camera: rl.Camera,
    delta: f32,
    speed: f32,
    input_key: CameraInputKey,
) rl.Camera {
    const forward = camera.target.subtract(camera.position).normalize();
    const up = camera.up.normalize();
    const right = forward.crossProduct(up).normalize();

    const forward_delta = forward.scale(input_key.getInputForward() * speed * delta);
    const up_delta = up.scale(input_key.getInputUp() * speed * delta);
    const right_delta = right.scale(input_key.getInputRight() * speed * delta);
    const movement_delta = forward_delta.add(up_delta).add(right_delta);

    var cam = camera;
    cam.position = camera.position.add(movement_delta);
    cam.target = camera.target.add(movement_delta);

    return cam;
}

// Quake 3 zoom sens formula
fn getZoomSensitivityFactor(fovy: f32) f32 { return fovy / 75; }

pub fn cameraFreeLook(
    camera: rl.Camera,
    input_mouse_motion: CameraInputMouseMotion
) rl.Camera {
    const dy = input_mouse_motion.getYawRadDelta();
    const dp = input_mouse_motion.getPitchRadDelta();
    const forward = camera.target.subtract(camera.position).normalize();
    const up = camera.up.normalize();
    const right = forward.crossProduct(up).normalize();
    const new_forward = forward.rotateByAxisAngle(right, dp).rotateByAxisAngle(up, dy);
    
    var cam = camera;
    cam.target = camera.position.add(new_forward);
    
    return cam;
}


// pub const CameraType = enum {
//     free, // FreeLook, FreeMove
//     first_person, // FreeLook with Constraint, SetCameraPosition + SetCameraUpRot
// };
