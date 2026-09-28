// Feather disable all

///
/// Return back the current time of a system.
///
/// @param {Struct.__SpartaClassSystem} system The system.
function SpartaSystemGetTime(_system)
{
    if (!__SpartaEnsureSystem(_system))
    {
        __SpartaError($"Particle system passed in is invalid.");
    }
    
    return _system.GetTime();
}