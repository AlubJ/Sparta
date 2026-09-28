// Feather disable all

///
/// This will set whether the emitter is dynamic or not. A dynamic emitter will
/// allow the emitter to be changed while retaining the already spawned particles
/// to remain on their original path. This will incur performance hits so only
/// set the emitter to be dynamic when you need it to be dynamic.
///
/// @param {Struct.__SpartaClassEmitter} emitter The emitter.
/// @param {Bool} dynamic
function SpartaEmitterSetDynamic(_emitter, _dynamic)
{
    if (!__SpartaEnsureEmitter(_emitter))
    {
        __SpartaError($"Particle emitter passed in is invalid.");
    }
    
    _emitter.SetDynamic(_dynamic);
}