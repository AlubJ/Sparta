// Feather disable all

///
/// This function will retire all currently active emitters in a system.
///
/// @param {Struct.__SpartaClassSystem} system The system.
/// @param {Bool} force
function SpartaSystemRetireAll(_system, _force)
{
    if (!__SpartaEnsureSystem(_system))
    {
        __SpartaError($"Particle system passed in is invalid.");
    }
    
    _system.RetireAll(_force);
}