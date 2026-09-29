// Feather disable all

///
/// Set the system to be paused or not paused.
///
/// @param {Struct.__SpartaClassSystem} system
/// @param {Bool} pause
function SpartaSystemSetPause(_system, _pause)
{
    if (!__SpartaEnsureSystem(_system))
    {
        __SpartaError($"Particle system passed in is invalid.");
    }
    
    _system.SetPause(_pause);
}