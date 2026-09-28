// Feather disable all

///
/// This function will step the particle system. The time increment parameter
/// is used to step each particle. The time increment value is measured in
/// seconds, so the usual formula for stepping the system would be `1/fps`
/// though this can be changed for various reasons.
///
/// @param {Struct.__SpartaClassSystem} system The system to step.
/// @param {Real} increment The amount of time to increment this frame.
function SpartaSystemStep(_system, _increment)
{
    if (!__SpartaEnsureSystem(_system))
    {
        __SpartaError($"Particle system passed in is invalid.");
    }
    
    _system.Step(_increment);
}