// Feather disable all

///
/// Get the particle count of a system.
///
/// @param {Struct.__SpartaClassSystem} system The system.
function SpartaSystemGetParticleCount(_system)
{
    if (!__SpartaEnsureSystem(_system))
    {
        __SpartaError($"Particle system passed in is invalid.");
    }
    
    return _system.GetParticleCount();
}