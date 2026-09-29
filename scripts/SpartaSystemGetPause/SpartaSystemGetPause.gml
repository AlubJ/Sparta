// Feather disable all

///
/// Get whether a system is paused or not.
///
/// @param {Struct.__SpartaClassSystem} system
function SpartaSystemGetPause(_system)
{
    if (!__SpartaEnsureSystem(_system))
    {
        __SpartaError($"Particle system passed in is invalid.");
    }
    
    return _system.GetPause();
}