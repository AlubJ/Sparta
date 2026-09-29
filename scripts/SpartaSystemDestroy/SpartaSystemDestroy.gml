// Feather disable all

///
/// Clear and destroy a system.
///
/// @param {Struct.__SpartaClassSystem} system
function SpartaSystemDestroy(_system)
{
    if (!__SpartaEnsureSystem(_system))
    {
        __SpartaError($"Particle system passed in is invalid.");
    }
    
    _system.Destroy();
}