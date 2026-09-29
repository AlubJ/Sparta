// Feather disable all

///
/// Draw the a particle system. This should be called after already submitting your camera.
///
/// @param {Struct.__SpartaClassSystem} system
function SpartaSystemDraw(_system)
{
    if (!__SpartaEnsureSystem(_system))
    {
        __SpartaError($"Particle system passed in is invalid.");
    }
    
    _system.Draw();
}