// Feather disable all

///
/// Get the sector angle of an emitter.
///
/// @param {Struct.__SpartaClassEmitter} emitter The emitter.
function SpartaEmitterGetSector(_emitter)
{
    if (!__SpartaEnsureEmitter(_emitter))
    {
        __SpartaError($"Particle emitter passed in is invalid.");
    }
    
    return _emitter.GetSector();
}