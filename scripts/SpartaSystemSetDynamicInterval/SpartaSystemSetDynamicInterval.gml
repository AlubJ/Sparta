// Feather disable all

///
/// The dynamic interval is how often a new emitter is created when an emitter
/// is dynamic. Particles interpolate between the last and current emitter.
/// This defaults to `1`.
///
/// @param {Struct.__SpartaClassSystem} system
/// @param {Real} interval
function SpartaSystemSetDynamicInterval(_system, _interval)
{
    if (!__SpartaEnsureSystem(_system))
    {
        __SpartaError($"Particle system passed in is invalid.");
    }
    
    _system.SetDynamicInterval(_interval);
}