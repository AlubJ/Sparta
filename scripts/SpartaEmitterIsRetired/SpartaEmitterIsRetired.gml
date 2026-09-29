// Feather disable all

///
/// Get whether an emitter is retired.
///
/// @param {Struct.__SpartaClassEmitter} emitter The emitter.
function SpartaEmitterIsRetired(_emitter)
{
    if (!__SpartaEnsureEmitter(_emitter))
    {
        __SpartaError($"Particle emitter passed in is invalid.");
    }
    
    return _emitter.IsRetired();
}