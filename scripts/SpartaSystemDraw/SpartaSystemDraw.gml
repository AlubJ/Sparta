// Feather disable all

///
/// This function will draw the particle system passed in. This should be called
/// after already submitting your camera.
///
/// @param {Struct.__SpartaClassSystem} system The system to draw.
function SpartaSystemDraw(_system)
{
    if (!__SpartaEnsureSystem(_system))
    {
        __SpartaError($"Particle system passed in is invalid.");
    }
    
    _system.Draw();
}