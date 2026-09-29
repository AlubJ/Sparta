// Feather disable all

/// 
/// Play the effect at specific coordinates unlike `SpartaEffectInstancePlay()`.
///
/// @param {Struct.__SpartaClassEffectInstance} instance
/// @param {Real} xPosition
/// @param {Real} yPosition
/// @param {Real} zPosition
function SpartaEffectInstancePlayAt(_instance, _xPosition, _yPosition, _zPosition)
{
    if (!__SpartaEnsureEffectInstance(_instance))
    {
        __SpartaError("Effect instance passed in is invalid.");
    }
    
    _instance.PlayAt(_xPosition, _yPosition, _zPosition);
}