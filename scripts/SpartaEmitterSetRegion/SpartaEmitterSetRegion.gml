// Feather disable all

///
/// Set an emitters region. The region is the point and bounds in space where a particle
/// can spawn.
///
/// @param {Struct.__SpartaClassEmitter} emitter The emitter.
/// @param {Real} xPosition
/// @param {Real} yPosition
/// @param {Real} zPosition
/// @param {Real} xRotation
/// @param {Real} yRotation
/// @param {Real} zRotation
/// @param {Real} xScale
/// @param {Real} yScale
/// @param {Real} zScale
function SpartaEmitterSetRegion(_emitter, _xPosition, _yPosition, _zPosition, _xRotation, _yRotation, _zRotation, _xScale, _yScale, _zScale)
{
    if (!__SpartaEnsureEmitter(_emitter))
    {
        __SpartaError($"Particle emitter passed in is invalid.");
    }
    
    _emitter.SetRegion(_xPosition, _yPosition, _zPosition, _xRotation, _yRotation, _zRotation, _xScale, _yScale, _zScale);
}