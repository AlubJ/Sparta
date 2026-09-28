// Feather disable all

///
/// Get the dynamic interval of a system.
///
/// @param {Struct.__SpartaClassSystem} system The system.
function SpartaSystemGetDynamicInterval(_system)
{
    if (!__SpartaEnsureSystem(_system))
    {
        __SpartaError($"Particle system passed in is invalid.");
    }
    
    return _system.GetDynamicInterval();
}