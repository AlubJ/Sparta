// Feather disable all

///
/// Reeturn back whether an emitter is dynamic.
///
/// @param {Struct.__SpartaClassEmitter} emitter The emitter.
function SpartaEmitterGetDynamic(_emitter)
{
    if (!__SpartaEnsureEmitter(_emitter))
    {
        __SpartaError($"Particle emitter passed in is invalid.");
    }
    
    return _emitter.GetDynamic();
}