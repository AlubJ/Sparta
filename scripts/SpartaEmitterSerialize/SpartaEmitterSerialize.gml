// Feather disable all

///
/// Convert the emitter into a struct that can be read back later.
///
/// @param {Struct.__SpartaClassEmitter} emitter
function SpartaEmitterSerialize(_emitter)
{
    if (!__SpartaEnsureEmitter(_emitter))
    {
        __SpartaError($"Particle emitter passed in is invalid.");
    }
    
    return _emitter.Serialize();
}