// Feather disable all

///
/// Get the draw calls of a system.
///
/// @param {Struct.__SpartaClassSystem} system The system.
function SpartaSystemGetDrawCalls(_system)
{
    if (!__SpartaEnsureSystem(_system))
    {
        __SpartaError($"Particle system passed in is invalid.");
    }
    
    return _system.GetDrawCalls();
}