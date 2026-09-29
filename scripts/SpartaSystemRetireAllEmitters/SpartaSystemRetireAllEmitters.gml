// Feather disable all

///
/// Retire all currently active emitters in a system.
///
/// @param {Struct.__SpartaClassSystem} system
/// @param {Bool} force
function SpartaSystemRetireAllEmitters(_system, _force)
{
    if (!__SpartaEnsureSystem(_system))
    {
        __SpartaError($"Particle system passed in is invalid.");
    }
    
    _system.RetireAllEmitters(_force);
}