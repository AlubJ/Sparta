// Feather disable all

///
/// Stop all currently active effects in a system.
///
/// @param {Struct.__SpartaClassSystem} system
function SpartaSystemStopAllEffects(_system)
{
    if (!__SpartaEnsureSystem(_system))
    {
        __SpartaError($"Particle system passed in is invalid.");
    }
    
    _system.StopAllEffects();
}