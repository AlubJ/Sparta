// Feather disable all

///
/// Set the emitters region rotation.
///
/// @param {Struct.__SpartaClassEmitter} emitter The emitter.
/// @param {Real} xRotation
/// @param {Real} yRotation
/// @param {Real} zRotation
function SpartaEmitterSetRegionRotation(_emitter, _xRotation, _yRotation, _zRotation)
{
    if (!__SpartaEnsureEmitter(_emitter))
    {
        __SpartaError($"Particle emitter passed in is invalid.");
    }
    
    _emitter.SetRegionRotation(_xRotation, _yRotation, _zRotation);
}