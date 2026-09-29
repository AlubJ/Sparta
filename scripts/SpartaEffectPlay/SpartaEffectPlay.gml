// Feather disable all

/// 
/// This will fire-and-forget play an effect. If you need to reuse an effect, consider
/// creating an effect instance and reuse that.
///
/// @param {Struct.__SpartaClassSystem} system
/// @param {Struct.__SpartaClassEffect} effect
/// @param {Real} xPosition
/// @param {Real} yPosition
/// @param {Real} zPosition
function SpartaEffectPlay(_system, _effect, _xPosition = 0, _yPosition = 0, _zPosition = 0)
{
    if (!__SpartaEnsureSystem(_system))
    {
        __SpartaError("Particle system passed in is invalid.");
    }
    
    if (!__SpartaEnsureEffect(_effect))
    {
        __SpartaError("Effect passed in is invalid.");
    }
    
    return new __SpartaClassEffectInstance(_system, _effect).PlayAt(_xPosition, _yPosition, _zPosition);
}