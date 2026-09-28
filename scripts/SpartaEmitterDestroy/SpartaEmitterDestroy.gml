// Feather disable all

///
/// Destroy an emitter.
///
/// @param {Struct.__SpartaClassEmitter} emitter The emitter.
function SpartaEmitterRetire(_emitter)
{
    if (!__SpartaEnsureEmitter(_emitter))
    {
        __SpartaError($"Particle emitter passed in is invalid.");
    }
    
    _emitter.Destroy();
}