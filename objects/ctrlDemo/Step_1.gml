/// @desc Step the camera
if (room == rmWelcome)
{
    exit;
}

global.camera.stepEditorThird([0, 0, window_get_width(), window_get_height()]);