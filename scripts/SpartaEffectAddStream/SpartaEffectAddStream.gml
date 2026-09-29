// Feather disable all

/// 
/// This will add a stream instruction to your effect.
///
/// @param {Struct.__SpartaClassEffect} effect
/// @param {Real} time
/// @param {Struct.__SpartaClassType} type
/// @param {Real} particlesPerStep
/// @param {Real} duration
/// @param {Real} xPosition
/// @param {Real} yPosition
/// @param {Real} zPosition
/// @param {Real} [xRotation]
/// @param {Real} [yRotation]
/// @param {Real} [zRotation]
/// @param {Real} [xScale]
/// @param {Real} [yScale]
/// @param {Real} [zScale]
/// @param {Constant.SPARTA_SHAPE_*} [shape]
/// @param {Real} [sector]
/// @param {Constant.SPARTA_DISTR_*} [distribution]
function SpartaEffectAddStream(_effect, _time, _type, _particlesPerStep, _duration, _xPosition, _yPosition, _zPosition, _xRotation = 0, _yRotation = 0, _zRotation = 0, _xScale = 1, _yScale = 1, _zScale = 1, _shape = SPARTA_SHAPE_SPHERE, _sector = 360, _distribution = SPARTA_DISTR_LINEAR)
{
    if (!__SpartaEnsureEffect(_effect))
    {
        __SpartaError("Effect passed in is invalid.");
    }
    
    _effect.AddBurst(_time, _type, _particlesPerStep, _duration, _xPosition, _yPosition, _zPosition, _xRotation, _yRotation, _zRotation, _xScale, _yScale, _zScale, _shape, _sector, _distribution);
}