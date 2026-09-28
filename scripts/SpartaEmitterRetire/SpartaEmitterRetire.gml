// Feather disable all

///
/// Retiring an emitter will make it stop producing particles. Setting it to force
/// will retire and immediately destroy the emitter.
///
/// @param {Struct.__SpartaClassEmitter} emitter The emitter.
/// @param {Bool} force
function SpartaEmitterRetire(_emitter, _force)
{
    if (!__SpartaEnsureEmitter(_emitter))
    {
        __SpartaError($"Particle emitter passed in is invalid.");
    }
    
    _emitter.Retire(_force);
}