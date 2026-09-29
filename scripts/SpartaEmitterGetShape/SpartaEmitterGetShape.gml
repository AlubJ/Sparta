// Feather disable all

///
/// Get the shape of an emitter.
///
/// @param {Struct.__SpartaClassEmitter} emitter The emitter.
function SpartaEmitterGetShape(_emitter)
{
    if (!__SpartaEnsureEmitter(_emitter))
    {
        __SpartaError($"Particle emitter passed in is invalid.");
    }
    
    return _emitter.GetShape();
}