// Feather disable all

///
/// Set the emitters region position.
///
/// @param {Struct.__SpartaClassEmitter} emitter The emitter.
/// @param {Real} xPosition
/// @param {Real} yPosition
/// @param {Real} zPosition
function SpartaEmitterSetRegionPosition(_emitter, _xPosition, _yPosition, _zPosition)
{
    if (!__SpartaEnsureEmitter(_emitter))
    {
        __SpartaError($"Particle emitter passed in is invalid.");
    }
    
    _emitter.SetRegionPosition(_xPosition, _yPosition, _zPosition);
}