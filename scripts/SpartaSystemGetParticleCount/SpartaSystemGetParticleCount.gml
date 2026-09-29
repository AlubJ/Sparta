// Feather disable all

///
/// Get the estimated particle count of a system. This will not get the actual
/// active particle count.
///
/// @param {Struct.__SpartaClassSystem} system
function SpartaSystemGetParticleCount(_system)
{
    if (!__SpartaEnsureSystem(_system))
    {
        __SpartaError($"Particle system passed in is invalid.");
    }
    
    return _system.GetParticleCount();
}