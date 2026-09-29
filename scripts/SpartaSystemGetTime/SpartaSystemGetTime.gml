// Feather disable all

///
/// Get the current time of a system.
///
/// @param {Struct.__SpartaClassSystem} system
function SpartaSystemGetTime(_system)
{
    if (!__SpartaEnsureSystem(_system))
    {
        __SpartaError($"Particle system passed in is invalid.");
    }
    
    return _system.GetTime();
}