function Camera() constructor
{
	// Create Camera
	__camera = camera_create();
	camera_set_default(__camera);
	
	// Raw Position Variables
	position			= [0, 0, 0];
	lookAtPosition		= [0, 0, 0];
	
	// Smooth Position Variables
	__smoothPosition		= [0, 0, 0];
	__smoothLookAtPosition	= [0, 0, 0];
	
	// Raw Look Directions
	yaw = 0;
	pitch = 0;
	roll = 0;
	distance = 8;
	
	// Smooth Look Directions
	__smoothYaw = 0;
	__smoothPitch = 0;
	__smoothRoll = 0;
	__smoothCameraDistance = 8;
	
	// Up Vector (It's -1 to compensate drawing to the screen, increasing the z position will go up)
	__upVector = [0, 0, -1];
	
	// Clip Planes
	__zNear = 0.1;
	__zFar = 1000;
	
	// Aspect and FOV
	__aspectRatio = room_width / room_height;
	__fov = 70;
	
	// Matrices
	__viewMatrix = matrix_build_lookat(position[0], position[1], position[2], lookAtPosition[0], lookAtPosition[1], lookAtPosition[2], __upVector[0], __upVector[1], __upVector[2]);
	__projMatrix = matrix_build_projection_perspective_fov(__fov, __aspectRatio, __zNear, __zFar);
	
	// Camera Pitch Lock
	__pitchLock = 60;
	
	// Editor
	__active = false;
	
	/// @func submit([clear])
	/// @desc Submit the camera.
	static submit = function(_clear = false)
	{
		// Draw Clear Alpha
		draw_clear_alpha(c_black, _clear ? 0 : 1);
		
		// Build View and Projection Matrices
		__viewMatrix = matrix_build_lookat(position[0], position[1], position[2], lookAtPosition[0], lookAtPosition[1], lookAtPosition[2], __upVector[0], __upVector[1], __upVector[2]);
		__projMatrix = matrix_build_projection_perspective_fov(__fov, __aspectRatio, __zNear, __zFar);
		
		// Set Camera Matrices
		camera_set_view_mat(__camera, __viewMatrix);
		camera_set_proj_mat(__camera, __projMatrix);
		
		// Apply Camera
		camera_apply(__camera);
	}
	
	/// @func stepThird()
	/// @desc Step the camera in third person.
	static stepThird = function()
	{
		position[0] = lookAtPosition[0] + distance * dcos(yaw) * dcos(pitch);
		position[1] = lookAtPosition[1] - distance * dsin(yaw) * dcos(pitch);
		position[2] = lookAtPosition[2] - distance * dsin(pitch);
	}
	
	#region Editor
	
	/// @func stepEditorThird(bounds)
	/// @desc Step the editors third person camera in defined bounds.
	/// @arg {Array} bounds The bounds.
	static stepEditorThird = function()
	{
		var _cursorX = window_mouse_get_x();
		var _cursorY = window_mouse_get_y();
		if (_cursorX > 0 && _cursorX < window_get_width() && _cursorY > 0 && _cursorY < window_get_height())
		{
			if ((device_mouse_check_button_pressed(0, mb_left) || device_mouse_check_button_pressed(0, mb_right)) || device_mouse_check_button(0, mb_middle) && !__active)
			{
				__active = true;
				window_set_cursor(cr_size_all);
			}
			
			if (mouse_wheel_up())
			{
				distance -= (distance / 4);
			}
			
			if (mouse_wheel_down())
			{
				distance += (distance / 3);
			}
		}
        
        if (device_mouse_check_button(0, mb_left) && __active)
		{
			yaw += window_mouse_get_delta_x() * 0.25;
			pitch -= window_mouse_get_delta_y() * 0.25;
			pitch = clamp(pitch, -89.999, 89.999);
        }
		
		if ((device_mouse_check_button_released(0, mb_left) || device_mouse_check_button_released(0, mb_right)) || device_mouse_check_button_released(0, mb_middle) && __active)
		{
			__active = false;
			window_set_cursor(cr_default);
		}
		
		distance = clamp(distance, 1, 20);
		
		stepThird();
	}
	
	#endregion
	
	#region Getters and Setters
	
	/// @func getCamera()
	/// @desc Return the raw camera.
	static getCamera = function()
	{
		return __camera;
	}
	
	/// @func getPosition()
	/// @desc Return the raw position.
	static getPosition = function()
	{
		return position;
	}
	
	/// @func setPosition(x, y, z)
	/// @desc Set the raw position.
	static setPosition = function(_x, _y, _z)
	{
		position[0] = _x;
		position[1] = _y;
		position[2] = _z;
	}
	
	/// @func addPosition(x, y, z)
	/// @desc Add the raw position.
	static setPosition = function(_x, _y, _z)
	{
		position[0] += _x;
		position[1] += _y;
		position[2] += _z;
	}
	
	/// @func getLookPosition()
	/// @desc Return the look position.
	static getLookPosition = function()
	{
		return lookAtPosition;
	}
	
	/// @func setLookPosition(x, y, z)
	/// @desc Set the look position.
	static setLookPosition = function(_x, _y, _z)
	{
		lookAtPosition[0] = _x;
		lookAtPosition[1] = _y;
		lookAtPosition[2] = _z;
	}
	
	/// @func addLookPosition(x, y, z)
	/// @desc Add the look position.
	static addLookPosition = function(_x, _y, _z)
	{
		lookAtPosition[0] += _x;
		lookAtPosition[1] += _y;
		lookAtPosition[2] += _z;
	}
	
	/// @func setYaw(yaw)
	/// @desc Set the yaw of the camera.
	/// @arg {Real} yaw
	static setYaw = function(_yaw)
	{
		yaw = _yaw;
		__smoothYaw = _yaw;
	}
	
	/// @func setPitch(pitch)
	/// @desc Set the pitch of the camera.
	/// @arg {Real} pitch
	static setPitch = function(_pitch)
	{
		pitch = clamp(_pitch, -__pitchLock, __pitchLock);
    }
    
	#endregion
}