// Feather disable all

///
/// Deserialize emitter data from a struct.
///
/// @param {Struct.__SpartaClassEmitter} emitter The emitter
/// @param {Struct} struct
function SpartaEmitterDeserialize(_emitter, _struct)
{
    if (!__SpartaEnsureEmitter(_emitter))
    {
        __SpartaError($"Particle emitter passed in is invalid.");
    }
    
    return _emitter.Deserialize(_struct);
}