// Feather disable all

///
/// This will set the system passed in to be paused or not paused.
///
/// @param {Struct.__SpartaClassSystem} system The system.
/// @param {Bool} pause
function SpartaSystemSetPause(_system, _pause)
{
    if (!__SpartaEnsureSystem(_system))
    {
        __SpartaError($"Particle system passed in is invalid.");
    }
    
    _system.SetPause(_pause);
}