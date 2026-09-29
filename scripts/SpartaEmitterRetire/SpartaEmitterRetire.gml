// Feather disable all

///
/// Retiring an emitter will make it stop producing particles.
///
/// @param {Struct.__SpartaClassEmitter} emitter
function SpartaEmitterRetire(_emitter)
{
    if (!__SpartaEnsureEmitter(_emitter))
    {
        __SpartaError($"Particle emitter passed in is invalid.");
    }
    
    return _emitter.Retire(false);
}