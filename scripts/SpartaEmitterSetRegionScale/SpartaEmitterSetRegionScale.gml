// Feather disable all

///
/// Set the emitters region scale.
///
/// @param {Struct.__SpartaClassEmitter} emitter The emitter.
/// @param {Real} xScale
/// @param {Real} yScale
/// @param {Real} zScale
function SpartaEmitterSetRegionScale(_emitter, _xScale, _yScale, _zScale)
{
    if (!__SpartaEnsureEmitter(_emitter))
    {
        __SpartaError($"Particle emitter passed in is invalid.");
    }
    
    _emitter.SetRegionScale(_xScale, _yScale, _zScale);
}