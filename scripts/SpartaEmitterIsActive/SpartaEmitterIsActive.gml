// Feather disable all

///
/// Return back whether an emitter is active.
///
/// @param {Struct.__SpartaClassEmitter} emitter The emitter.
function SpartaEmitterIsActive(_emitter)
{
    if (!__SpartaEnsureEmitter(_emitter))
    {
        __SpartaError($"Particle emitter passed in is invalid.");
    }
    
    return _emitter.IsActive();
}