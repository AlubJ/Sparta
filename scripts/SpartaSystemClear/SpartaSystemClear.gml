// Feather disable all

///
/// Clear all the active emitters from a system.
///
/// @param {Struct.__SpartaClassSystem} system
function SpartaSystemClear(_system)
{
    if (!__SpartaEnsureSystem(_system))
    {
        __SpartaError($"Particle system passed in is invalid.");
    }
    
    _system.Clear();
}