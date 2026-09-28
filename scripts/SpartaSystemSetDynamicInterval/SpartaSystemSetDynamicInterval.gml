// Feather disable all

///
/// The dynamic interval is how often a new emitter is created when an emitter
/// is dynamic. This defaults to `1`.
///
/// @param {Struct.__SpartaClassSystem} system The system.
/// @param {Real} interval
function SpartaSystemSetDynamicInterval(_system, _interval)
{
    if (!__SpartaEnsureSystem(_system))
    {
        __SpartaError($"Particle system passed in is invalid.");
    }
    
    _system.SetDynamicInterval(_interval);
}