// Feather disable all

///
/// Get the age of an emitter.
///
/// @param {Struct.__SpartaClassEmitter} emitter The emitter.
function SpartaEmitterGetAge(_emitter)
{
    if (!__SpartaEnsureEmitter(_emitter))
    {
        __SpartaError($"Particle emitter passed in is invalid.");
    }
    
    return _emitter.GetAge();
}